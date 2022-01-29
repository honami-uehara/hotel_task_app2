class AddImageAndProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :string
    add_column :users, :introduction, :text
    add_column :users, :password, :string
  end
end
