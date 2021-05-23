class AddBuiltToKatas < ActiveRecord::Migration[6.1]
  def change
    add_column :kata, :built, :string
  end
end
