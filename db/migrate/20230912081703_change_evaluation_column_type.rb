class ChangeEvaluationColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :subjects, :evaluation, :integer
  end
end
