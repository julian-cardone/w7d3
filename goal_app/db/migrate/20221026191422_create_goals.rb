class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.boolean :private
      t.boolean :completed
      t.bigint :author_id, null: false

      t.timestamps
    end
    add_foreign_key :goals, :users, column: :author_id, primary_key: :id 
  end
end
