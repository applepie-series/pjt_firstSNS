class AddTelSexWebTousers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tel, :string
    add_column :users, :sex, :integer
    add_column :users, :web, :string
  end
end
