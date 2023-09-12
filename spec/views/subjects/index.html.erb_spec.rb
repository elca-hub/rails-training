require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        name: "Name",
        evaluation: "Evaluation",
        unit_value: 2
      ),
      Subject.create!(
        name: "Name",
        evaluation: "Evaluation",
        unit_value: 2
      )
    ])
  end

  it "renders a list of subjects" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Evaluation".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end