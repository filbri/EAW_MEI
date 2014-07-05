require 'spec_helper'

describe "encarregados/new" do
  before(:each) do
    assign(:encarregado, stub_model(Encarregado,
      :nome => "MyString",
      :nBI => 1,
      :morada => "MyString",
      :cp => "MyString",
      :localidade => "MyString",
      :email => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new encarregado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", encarregados_path, "post" do
      assert_select "input#encarregado_nome[name=?]", "encarregado[nome]"
      assert_select "input#encarregado_nBI[name=?]", "encarregado[nBI]"
      assert_select "input#encarregado_morada[name=?]", "encarregado[morada]"
      assert_select "input#encarregado_cp[name=?]", "encarregado[cp]"
      assert_select "input#encarregado_localidade[name=?]", "encarregado[localidade]"
      assert_select "input#encarregado_email[name=?]", "encarregado[email]"
      assert_select "input#encarregado_user_id[name=?]", "encarregado[user_id]"
    end
  end
end
