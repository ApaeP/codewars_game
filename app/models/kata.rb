class Kata < ApplicationRecord
  belongs_to :user
  has_many :solutions

  validates :codewars_id, presence: true, uniqueness: true
end
