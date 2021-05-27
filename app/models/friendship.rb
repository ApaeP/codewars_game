# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  friend_id  :integer
#  confirmed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Friendship < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: { scope: :friend_id }

  def self.requested?(id1, id2)
    case1 = !Friendship.where(user_id: id1, friend_id: id2).empty?
    case2 = !Friendship.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.confirmed_record?(id1, id2)
    case1 = !Friendship.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = !Friendship.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_friendship(id1, id2)
    if Friendship.where(user_id: id1, friend_id: id2, confirmed: true).empty?
      Friendship.where(user_id: id2, friend_id: id1, confirmed: true)[0].id
    else
      Friendship.where(user_id: id1, friend_id: id2, confirmed: true)[0].id
    end
  end
end
