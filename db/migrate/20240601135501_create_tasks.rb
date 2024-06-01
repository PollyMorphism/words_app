class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :points, null: false, default: 1
      t.boolean :repeatable,  default: true

      t.timestamps
    end
  end
end
