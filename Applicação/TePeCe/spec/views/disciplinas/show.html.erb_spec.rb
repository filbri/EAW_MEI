require 'spec_helper'

describe "disciplinas/show" do
  before(:each) do
    @disciplina = assign(:disciplina, stub_model(Disciplina))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
