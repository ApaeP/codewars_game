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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
