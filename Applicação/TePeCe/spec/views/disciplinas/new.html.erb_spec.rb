require 'spec_helper'

describe "disciplinas/new" do
  before(:each) do
    assign(:disciplina, stub_model(Disciplina).as_new_record)
  end

  it "renders new disciplina form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", disciplinas_path, "post" do
    end
  end
end
