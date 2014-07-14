require 'spec_helper'

describe "exercicios/show" do
  before(:each) do
    @exercicio = assign(:exercicio, stub_model(Exercicio,
      :titulo => "Titulo",
      :enunciado => "Enunciado",
      :aluno_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Titulo/)
    rendered.should match(/Enunciado/)
    rendered.should match(/1/)
  end
end
