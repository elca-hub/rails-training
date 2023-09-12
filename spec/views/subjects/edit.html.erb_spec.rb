require 'rails_helper'

RSpec.describe "subjects/edit", type: :view do
  let(:subject) {
    Subject.create!(
      name: "MyString",
      evaluation: "MyString",
      unit_value: 1
    )
  }

  before(:each) do
    assign(:subject, subject)
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", subject_path(subject), "post" do

      assert_select "input[name=?]", "subject[name]"

      assert_select "input[name=?]", "subject[evaluation]"

      assert_select "input[name=?]", "subject[unit_value]"
    end
  end
end
