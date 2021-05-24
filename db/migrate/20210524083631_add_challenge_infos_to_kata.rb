class AddChallengeInfosToKata < ActiveRecord::Migration[6.1]
  def change
    add_column :kata, :challenge_infos, :jsonb
  end
end
