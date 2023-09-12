class ChangeEvaluationColumnType2 < ActiveRecord::Migration[7.0]
  def change
    change_column :subjects, :evaluation, :string
  end
end
