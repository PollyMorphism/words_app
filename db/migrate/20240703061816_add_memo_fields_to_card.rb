class AddMemoFieldsToCard < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :repetitions, :integer, default: 0
    add_column :cards, :ease_factor, :float, default: 2.5
    add_column :cards, :interval, :integer, default: 0
    add_column :cards, :review_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
