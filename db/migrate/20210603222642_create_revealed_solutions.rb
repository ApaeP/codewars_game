class CreateRevealedSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :revealed_solutions do |t|
      t.references :solution, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
