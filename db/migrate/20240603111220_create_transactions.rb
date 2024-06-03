class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :activity, null: false
      t.integer :points, null: false
      t.references :user, null: false, foreign_key: true
      t.references :transactable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
