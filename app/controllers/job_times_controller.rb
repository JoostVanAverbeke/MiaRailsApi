require 'job_time_streams'

class JobTimesController < ApplicationController
  before_action :find_employee, :get_date_range_params

  def index
    render json: @job_times = @employee.job_times
  end

  def streams
    @streams = JobTimeStreams.new(@employee.job_times)
    @streams.build_job_time_streams
    render json: @streams
  end
  
  private

  def find_employee
    @employee = Employee.find(params[:employee_id]) unless params[:employee_id].blank?
  end

  def get_date_range_params
    @start = Date.parse(params[:start]) unless params[:start].blank?
    @end = Date.parse(params[:end]) unless params[:end].blank?
  end

end
