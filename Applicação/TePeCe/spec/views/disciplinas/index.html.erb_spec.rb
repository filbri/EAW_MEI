require 'spec_helper'

describe "disciplinas/index" do
  before(:each) do
    assign(:disciplinas, [
      stub_model(Disciplina),
      stub_model(Disciplina)
    ])
  end

  it "renders a list of disciplinas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
