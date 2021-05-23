class CreateKata < ActiveRecord::Migration[6.1]
  def change
    create_table :kata do |t|
      t.references :user, null: false, foreign_key: true
      t.string :codewars_id
      t.string :language
      t.string :level
      t.string :title
      t.text :instructions
      t.datetime :completed_at

      t.timestamps
    end
  end
end
