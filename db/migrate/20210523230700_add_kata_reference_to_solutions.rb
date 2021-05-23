class AddKataReferenceToSolutions < ActiveRecord::Migration[6.1]
  def change
    change_table :solutions do |t|
      t.references :kata, null: false, foreign_key: true
    end
  end
end
