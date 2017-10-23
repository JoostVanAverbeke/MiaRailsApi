class CreateJobTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :job_times do |t|
      t.integer :employee_id
      t.integer :project_id
      t.integer :corrective
      t.integer :functional
      t.integer :incidents
      t.integer :other

      t.timestamps
    end
  end
end
