class AddBuiltToKatas < ActiveRecord::Migration[6.1]
  def change
    add_column :kata, :built, :boolean, default: false
  end
end
