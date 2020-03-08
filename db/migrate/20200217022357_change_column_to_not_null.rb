class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column :rooms, :user_id, :integer, null: true
  end
  def down
    change_column :rooms, :user_id, :integer, null: false
  end
end
