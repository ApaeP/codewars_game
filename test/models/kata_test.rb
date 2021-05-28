# == Schema Information
#
# Table name: kata
#
#  id              :bigint           not null, primary key
#  codewars_id     :string
#  url             :string
#  title           :string
#  level           :integer
#  level_name      :string
#  level_color     :string
#  tags            :text             default([]), is an Array
#  category        :string
#  creation_date   :datetime
#  languages       :text             default([]), is an Array
#  vote_score      :integer
#  total_stars     :integer
#  description     :text
#  total_attempts  :integer
#  total_completed :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class KataTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
