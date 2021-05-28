class CreateKata < ActiveRecord::Migration[6.1]
  def change
    create_table :kata do |t|
      t.string :codewars_id
      t.string :url
      t.string :title
      t.integer :level
      t.string :level_name
      t.string :level_color
      t.text :tags, array: true, default: []
      t.string :category
      t.datetime :creation_date
      t.text :languages, array: true, default: []
      t.integer :vote_score
      t.integer :total_stars
      t.text :description
      t.integer :total_attempts
      t.integer :total_completed

      t.timestamps
    end
  end
end
