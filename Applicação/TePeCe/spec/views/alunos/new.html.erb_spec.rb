require 'spec_helper'

describe "alunos/new" do
  before(:each) do
    assign(:aluno, stub_model(Aluno,
      :nome => "MyString",
      :nBI => 1,
      :morada => "MyString",
      :cp => "MyString",
      :localidade => "MyString",
      :email => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new aluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", alunos_path, "post" do
      assert_select "input#aluno_nome[name=?]", "aluno[nome]"
      assert_select "input#aluno_nBI[name=?]", "aluno[nBI]"
      assert_select "input#aluno_morada[name=?]", "aluno[morada]"
      assert_select "input#aluno_cp[name=?]", "aluno[cp]"
      assert_select "input#aluno_localidade[name=?]", "aluno[localidade]"
      assert_select "input#aluno_email[name=?]", "aluno[email]"
      assert_select "input#aluno_user_id[name=?]", "aluno[user_id]"
    end
  end
end
