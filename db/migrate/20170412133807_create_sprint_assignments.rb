class CreateSprintAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :sprint_assignments do |t|
      t.integer :sprint_id
      t.integer :modification_id

      t.timestamps
    end
  end
end
