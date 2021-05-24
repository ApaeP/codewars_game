class Kata < ApplicationRecord
  belongs_to :user
  has_many :solutions

  validates :codewars_id, presence: true, uniqueness: true

  def level_text
    return 'none' unless challenge_infos

    challenge_infos['rank']['name']
  end

  def level_int
    return 0 unless challenge_infos

    challenge_infos['rank']['id']
  end

  def color
    return unless challenge_infos
    return '#df928e' unless challenge_infos['rank']['color']

    { 'white' => '#e6e6e6',
      'yellow' => '#ecb613',
      'blue' => '#3c7ebb',
      'purple' => '#866cc7'
    }[challenge_infos['rank']['color']]
  end
end
