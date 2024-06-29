class AddParentIdToDecks < ActiveRecord::Migration[7.1]
  def change
    add_column :decks, :parent_id, :integer
  end
end
