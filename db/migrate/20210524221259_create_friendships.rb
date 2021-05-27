class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
