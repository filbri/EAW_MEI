require 'spec_helper'

describe "resolucaos/new" do
  before(:each) do
    assign(:resolucao, stub_model(Resolucao,
      :resposta => "MyString",
      :exercicio_id => 1
    ).as_new_record)
  end

  it "renders new resolucao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resolucaos_path, "post" do
      assert_select "input#resolucao_resposta[name=?]", "resolucao[resposta]"
      assert_select "input#resolucao_exercicio_id[name=?]", "resolucao[exercicio_id]"
    end
  end
end
