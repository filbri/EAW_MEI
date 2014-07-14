require 'spec_helper'

describe "exercicios/edit" do
  before(:each) do
    @exercicio = assign(:exercicio, stub_model(Exercicio,
      :titulo => "MyString",
      :enunciado => "MyString",
      :aluno_id => 1
    ))
  end

  it "renders the edit exercicio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", exercicio_path(@exercicio), "post" do
      assert_select "input#exercicio_titulo[name=?]", "exercicio[titulo]"
      assert_select "input#exercicio_enunciado[name=?]", "exercicio[enunciado]"
      assert_select "input#exercicio_aluno_id[name=?]", "exercicio[aluno_id]"
    end
  end
end
