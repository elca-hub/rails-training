class AddUniqueToName < ActiveRecord::Migration[7.0]
  def up
    add_index :subjects, :name, unique: true
  end

  def down
    remove_index :subjects, column: :name, unique: true
  end
end
