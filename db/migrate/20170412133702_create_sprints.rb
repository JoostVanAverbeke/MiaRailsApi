class CreateSprints < ActiveRecord::Migration[5.0]
  def change
    create_table :sprints do |t|
      t.string :name
      t.text :long_description

      t.timestamps
    end
  end
end
