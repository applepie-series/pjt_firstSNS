class RemoveAddPictureToMicroposts < ActiveRecord::Migration[6.0]
  def up
    remove_column :microposts, :picture
  end

  def down
    add_column :microposts, :picture, :string
  end
end
