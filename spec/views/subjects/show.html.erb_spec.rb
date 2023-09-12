require 'rails_helper'

RSpec.describe "subjects/show", type: :view do
  before(:each) do
    assign(:subject, Subject.create!(
      name: "Name",
      evaluation: "Evaluation",
      unit_value: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Evaluation/)
    expect(rendered).to match(/2/)
  end
end
