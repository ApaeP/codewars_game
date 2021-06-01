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
  belongs_to :requester, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  validates  :recipient, uniqueness: { scope: :requester }

  scope :pending_requested_friendships_from, -> (user) {where(requester_id: user.id, status: "pending")}
  scope :pending_requested_friendships_for,  -> (user) {where(recipient_id: user.id, status: "pending")}

  enum status: {
    pending: 0,
    refused: 20,
    accepted: 100
  }

  def self.requested?(id1, id2)
    !Friendship.where(requester_id: id1, recipient_id: id2).empty? ||
    !Friendship.where(requester_id: id2, recipient_id: id1).empty?
  end

  def self.confirmed_record?(id1, id2)
    !Friendship.where(requester_id: id1, recipient_id: id2, status: "accepted").empty? ||
    !Friendship.where(requester_id: id2, recipient_id: id1, status: "accepted").empty?
  end

  def self.find_friendship(id1, id2)
    if Friendship.where(requester_id: id1, recipient_id: id2, status: "accepted").empty?
      Friendship.where(requester_id: id2, recipient_id: id1, status: "accepted")[0].id
    else
      Friendship.where(requester_id: id1, recipient_id: id2, status: "accepted")[0].id
    end
  end
end
