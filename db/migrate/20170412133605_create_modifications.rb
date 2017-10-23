class CreateModifications < ActiveRecord::Migration[5.0]
  def change
    create_table :modifications do |t|
      t.string :short_description
      t.text :long_description
      t.integer :analyst_id
      t.integer :analyse_reviewer_id
      t.integer :programmer_id
      t.integer :code_reviewer_id
      t.integer :tester_id
      t.integer :documenter_id
      t.integer :final_reviewer_id
      t.integer :status

      t.timestamps
    end
  end
end
