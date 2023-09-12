class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :evaluation
      t.integer :unit_value

      t.timestamps
    end
  end
end
