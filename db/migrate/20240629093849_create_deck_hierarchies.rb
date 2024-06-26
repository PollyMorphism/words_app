class CreateDeckHierarchies < ActiveRecord::Migration[7.1]
  def change
    create_table :deck_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :deck_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "deck_anc_desc_idx"

    add_index :deck_hierarchies, [:descendant_id],
      name: "deck_desc_idx"
  end
end
