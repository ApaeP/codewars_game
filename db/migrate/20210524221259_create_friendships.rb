class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :requester#, null: false, foreign_key: true
      t.references :recipient#, null: false, foreign_key: true
      t.integer    :status, default: 0
    end
    add_foreign_key :friendships, :users, column: :requester_id, primary_key: :id
    add_foreign_key :friendships, :users, column: :recipient_id, primary_key: :id
  end
end
