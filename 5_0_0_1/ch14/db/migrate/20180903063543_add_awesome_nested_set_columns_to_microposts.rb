class AddAwesomeNestedSetColumnsToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :parent_id, :integer
    add_column :microposts, :lft, :integer
    add_column :microposts, :rgt, :integer
    add_index  :microposts, :parent_id
    add_index  :microposts, :lft
    add_index  :microposts, :rgt
    # オプションのフィールド
    add_column :microposts, :depth,          :integer
    add_column :microposts, :children_count, :integer
    add_index  :microposts, :depth
  end
end
