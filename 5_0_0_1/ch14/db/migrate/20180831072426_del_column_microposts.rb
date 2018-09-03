class DelColumnMicroposts < ActiveRecord::Migration[5.0]
  def change
    remove_column :microposts, :ancestry
  end
end
