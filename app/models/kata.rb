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
    arr = description.split("```")
    arr.map!.with_index do |e, i|
      if i % 2 == 0
        e.split(/`/).map!.with_index do |x, y|
          if y % 2 == 0
            x
          else
            CodeRay.scan(x, :auto).html(wrap: :span, css: :class)
          end
        end.join
      else
        CodeRay.scan(e, :auto).div(css: :class)
      end
    end
    arr.join.html_safe
  end

  def completion_percentage
    (total_completed / (total_attempts / 100.0)).round(1)
  end
end


# def color # codewars hsl
#   return 'hsl(3, 56%, 72%)' unless level_color

#   { 'white' => 'hsl(0, 0%, 90%)',
#     'yellow' => 'hsl(45, 85%, 50%)',
#     'blue' => 'hsl(209, 51%, 48%)',
#     'purple' => 'hsl(257, 45%, 60%)'
#   }[level_color]
# end
