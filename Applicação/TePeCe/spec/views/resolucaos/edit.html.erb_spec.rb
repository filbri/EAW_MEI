require 'spec_helper'

describe "resolucaos/edit" do
  before(:each) do
    @resolucao = assign(:resolucao, stub_model(Resolucao,
      :resposta => "MyString",
      :exercicio_id => 1
    ))
  end

  it "renders the edit resolucao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resolucao_path(@resolucao), "post" do
      assert_select "input#resolucao_resposta[name=?]", "resolucao[resposta]"
      assert_select "input#resolucao_exercicio_id[name=?]", "resolucao[exercicio_id]"
    end
  end
end
