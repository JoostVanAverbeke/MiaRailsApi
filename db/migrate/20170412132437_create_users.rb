class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :short_name
      t.string :surname
      t.string :first_name

      t.timestamps
    end
  end
end
