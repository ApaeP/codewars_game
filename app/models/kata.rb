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
class Kata < ApplicationRecord
  has_many :solutions, dependent: :destroy
  has_many :completers, through: :solutions, source: :user

  scope :invalid, -> {where(level: nil)}
  scope :valid,   -> {where.not(level: nil)}

  validates :codewars_id, presence: true, uniqueness: true

  def code_description
    pre = ["<pre><code>", "</code></pre>"].cycle
    code = ["<code>", "</code>"].cycle
    arr = description.split("```")

    # previous_was_pre = false
    # (arr.count - 1).times do |i|
    #   if (arr[i + 1].match?(/\n/) && !previous_was_pre)
    #     arr[i] << pre.next
    #     previous_was_pre = true
    #   elsif previous_was_pre
    #     arr[i] << pre.next
    #     previous_was_pre = false
    #   else
    #     arr[i] << code.next
    #     previous_was_pre = false
    #   end
    # end
    arr.join.gsub(/\n/, '<br>').html_safe
  end

  def completed_by

  end

  # def color # dark
  #   return 'hsl(3, 56%, 60%)' unless level_color

  #   { 'white' => 'hsl(0, 0%, 78%)',
  #     'yellow' => 'hsl(45, 85%, 38%)',
  #     'blue' => 'hsl(209, 51%, 36%)',
  #     'purple' => 'hsl(257, 45%, 48%)'
  #   }[level_color]
  # end

  # def color # codewars hsl
  #   return 'hsl(3, 56%, 72%)' unless level_color

  #   { 'white' => 'hsl(0, 0%, 90%)',
  #     'yellow' => 'hsl(45, 85%, 50%)',
  #     'blue' => 'hsl(209, 51%, 48%)',
  #     'purple' => 'hsl(257, 45%, 60%)'
  #   }[level_color]
  # end

  # def color # codewars
  #   return '#df928e' unless level_color

  #   { 'white' => '#e6e6e6',
  #     'yellow' => '#ecb613',
  #     'blue' => '#3c7ebb',
  #     'purple' => '#866cc7'
  #   }[level_color]
  # end
end
