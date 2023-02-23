require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        studentname: "Studentname",
        section: "Section"
      ),
      Student.create!(
        studentname: "Studentname",
        section: "Section"
      )
    ])
  end

  it "renders a list of students" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Studentname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Section".to_s), count: 2
  end
end
