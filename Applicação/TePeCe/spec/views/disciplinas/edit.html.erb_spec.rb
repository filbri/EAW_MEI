require 'spec_helper'

describe "disciplinas/edit" do
  before(:each) do
    @disciplina = assign(:disciplina, stub_model(Disciplina))
  end

  it "renders the edit disciplina form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", disciplina_path(@disciplina), "post" do
    end
  end
end
