require 'spec_helper'

describe "profs/edit" do
  before(:each) do
    @prof = assign(:prof, stub_model(Prof,
      :nome => "MyString",
      :nBI => 1,
      :morada => "MyString",
      :cp => "MyString",
      :localidade => "MyString",
      :email => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit prof form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prof_path(@prof), "post" do
      assert_select "input#prof_nome[name=?]", "prof[nome]"
      assert_select "input#prof_nBI[name=?]", "prof[nBI]"
      assert_select "input#prof_morada[name=?]", "prof[morada]"
      assert_select "input#prof_cp[name=?]", "prof[cp]"
      assert_select "input#prof_localidade[name=?]", "prof[localidade]"
      assert_select "input#prof_email[name=?]", "prof[email]"
      assert_select "input#prof_user_id[name=?]", "prof[user_id]"
    end
  end
end
