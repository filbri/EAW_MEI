require 'spec_helper'

describe "exercicios/index" do
  before(:each) do
    assign(:exercicios, [
      stub_model(Exercicio,
        :titulo => "Titulo",
        :enunciado => "Enunciado",
        :aluno_id => 1
      ),
      stub_model(Exercicio,
        :titulo => "Titulo",
        :enunciado => "Enunciado",
        :aluno_id => 1
      )
    ])
  end

  it "renders a list of exercicios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Titulo".to_s, :count => 2
    assert_select "tr>td", :text => "Enunciado".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
