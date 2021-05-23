class AddInfosToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :codewars_api_token, :string
    add_column :users, :codewars_nickname, :string
  end
end
