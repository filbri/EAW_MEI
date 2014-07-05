require 'spec_helper'

describe "mensagens/edit" do
  before(:each) do
    @mensagen = assign(:mensagen, stub_model(Mensagen,
      :remetente => "MyString",
      :destinatario => "MyString",
      :assunto => "MyString",
      :mensagem => "MyString"
    ))
  end

  it "renders the edit mensagen form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mensagen_path(@mensagen), "post" do
      assert_select "input#mensagen_remetente[name=?]", "mensagen[remetente]"
      assert_select "input#mensagen_destinatario[name=?]", "mensagen[destinatario]"
      assert_select "input#mensagen_assunto[name=?]", "mensagen[assunto]"
      assert_select "input#mensagen_mensagem[name=?]", "mensagen[mensagem]"
    end
  end
end
