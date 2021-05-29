# == Schema Information
#
# Table name: solutions
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  kata_id      :bigint           not null
#  content      :text
#  languages    :text             default([]), is an Array
#  codewars_id  :string
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :kata
end
