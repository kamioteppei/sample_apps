class AddAncestryToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :ancestry, :string
    add_index :microposts, :ancestry
  end
end
