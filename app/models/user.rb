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
#  honor                  :integer
#  clan                   :string
#  leaderboard_position   :integer
#  first_name             :string
#  last_name              :string
#  overall_rank           :integer
#  overall_rank_name      :string
#  overall_rank_color     :string
#  overall_score          :integer
#  language_ranks         :jsonb
#  katas_authored_count   :integer
#  katas_completed_count  :integer
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :solutions
  has_many :katas, through: :solutions
  has_many :friendships

  has_many :pending_friendships, -> { where(confirmed: false) }, class_name: 'Friendship', foreign_key: 'friend_id'

  validates :codewars_api_token, presence: true, format: { with: /\A\w{20}\z/, message: "only allows letters" }
  validates :codewars_nickname, presence: true

  after_create :fetch_and_update_infos

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

  def fetch_and_update_infos
    update(UserInfoApi.new(self).user_infos)
  end

  def full_name
    return "noname" unless first_name
    first_name + ' ' + last_name
  end

  def preferred_language
    language_ranks.to_a.sort_by { |k| k.last["score"] }.last[0].capitalize
  end
end
