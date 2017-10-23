class StreamCoordinate
  attr_reader :x, :y, :y0, :series, :key
  def initialize(x, y, y0, series, key)
    @x = x
    @y = y
    @y0 = y0
    @series = series
    @key = key
  end
end

class JobTimeStream
  attr_reader :key
  attr_reader :values
  
  delegate :<<, :push, to: :values

  def initialize(key)
    @key = key
    @values = []
  end

 end

class JobTimeStreams
  attr_reader :corrective_job_time_stream
  attr_reader :functional_job_time_stream
  attr_reader :incidents_job_time_stream
  attr_reader :other_job_time_stream
  
  def initialize(job_times)
    @job_times = job_times
    @corrective_job_time_stream = JobTimeStream.new('Corrective')
    @functional_job_time_stream = JobTimeStream.new('Functional')
    @incidents_job_time_stream = JobTimeStream.new('Incidents')
    @other_job_time_stream = JobTimeStream.new('Other')
  end

  def build_job_time_streams()
    @job_times.group('job_times.id').group(:project_id).each do |job_time|
      corrective_stream_coordinate =
          StreamCoordinate.new(job_time.project.name, job_time.corrective, 0, 0, 'Corrective')
      functional_stream_coordinate =
          StreamCoordinate.new(job_time.project.name, job_time.functional, 0, 0, 'Functional')
      incidents_stream_coordinate =
          StreamCoordinate.new(job_time.project.name, job_time.incidents, 0, 0, 'Incidents')
      other_stream_coordinate =
          StreamCoordinate.new(job_time.project.name, job_time.other, 0, 0, 'Other')
      @corrective_job_time_stream << corrective_stream_coordinate
      @functional_job_time_stream << functional_stream_coordinate
      @incidents_job_time_stream << incidents_stream_coordinate
      @other_job_time_stream << other_stream_coordinate
    end
  end

  def as_json(options = {})
    {
        data: [
                @corrective_job_time_stream,
                @functional_job_time_stream,
                @incidents_job_time_stream,
                @other_job_time_stream
        ]
    }
  end

end