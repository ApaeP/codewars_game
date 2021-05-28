# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  codewars_api_token     :string
#  codewars_nickname      :string
#
class User < ApplicationRecord
  has_many :solutions
  has_many :katas, through: :solutions
  has_many :friendships
  has_many :pending_friendships, -> { where(confirmed: false) }, class_name: 'Friendship', foreign_key: 'friend_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friends
    friends_i_invited = Friendship.where(user: id, confirmed: true).pluck(:friend_id)
    friends_requests = Friendship.where(friend_id: id, confirmed: true).pluck(:user_id)
    User.where(id: [friends_i_invited, friends_requests].flatten)
  end

  def friend_with?(user)
    Friendship.confirmed_record?(id, user.id)
  end

  def request_friendship(user)
    friendships.create(friend_id: user.id)
  end

  def has_solution_for_this_kata?(kata)
    solutions.any? { |sol| sol.kata.id = kata.id }
  end
end
