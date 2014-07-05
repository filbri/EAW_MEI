require 'spec_helper'

describe "direcs/new" do
  before(:each) do
    assign(:direc, stub_model(Direc,
      :nome => "MyString",
      :nBI => 1,
      :morada => "MyString",
      :cp => "MyString",
      :localidade => "MyString",
      :email => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new direc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", direcs_path, "post" do
      assert_select "input#direc_nome[name=?]", "direc[nome]"
      assert_select "input#direc_nBI[name=?]", "direc[nBI]"
      assert_select "input#direc_morada[name=?]", "direc[morada]"
      assert_select "input#direc_cp[name=?]", "direc[cp]"
      assert_select "input#direc_localidade[name=?]", "direc[localidade]"
      assert_select "input#direc_email[name=?]", "direc[email]"
      assert_select "input#direc_user_id[name=?]", "direc[user_id]"
    end
  end
end
