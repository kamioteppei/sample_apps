class DelColumnFromMicroposts < ActiveRecord::Migration[5.0]
  def change
        remove_column :microposts, :ancestry
        #remove_index  :microposts, :index_microposts_on_ancestry
  end
end
