class AddColumnToMicroposts < ActiveRecord::Migration[5.0]
  def change
    #miropostを経路列挙モデルで、再帰的にネストできるようにする
    #https://techracho.bpsinc.jp/hira/2018_03_15/53872
     add_column :microposts, :ancestry, :string, index: true
  end
end
