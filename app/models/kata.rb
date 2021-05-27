# == Schema Information
#
# Table name: kata
#
#  id              :bigint           not null, primary key
#  codewars_id     :string
#  url             :string
#  title           :string
#  rank            :jsonb
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
class Kata < ApplicationRecord
  has_many :solutions, dependent: :destroy

  validates :codewars_id, presence: true, uniqueness: true

  def color
    return '#df928e' unless rank['color']

    { 'white' => '#e6e6e6',
      'yellow' => '#ecb613',
      'blue' => '#3c7ebb',
      'purple' => '#866cc7'
    }[rank['color']]
  end
end
