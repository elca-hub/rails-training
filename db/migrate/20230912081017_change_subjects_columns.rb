class ChangeSubjectsColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :subjects, :name, false
    change_column_null :subjects, :evaluation, false
    change_column_null :subjects, :unit_value, false
  end
end
