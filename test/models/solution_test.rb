# == Schema Information
#
# Table name: solutions
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  kata_id      :bigint           not null
#  content      :text
#  languages    :text             default([]), is an Array
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class SolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
