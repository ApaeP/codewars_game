class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :kata, null: false, foreign_key: true

      t.text :content
      t.text :languages, array: true, default: []
      t.datetime :completed_at

      t.timestamps
    end
  end
end
