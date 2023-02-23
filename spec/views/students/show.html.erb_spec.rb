require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    assign(:student, Student.create!(
      studentname: "Studentname",
      section: "Section"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Studentname/)
    expect(rendered).to match(/Section/)
  end
end
