require 'spec_helper'

describe "mensagens/new" do
  before(:each) do
    assign(:mensagen, stub_model(Mensagen,
      :remetente => "MyString",
      :destinatario => "MyString",
      :assunto => "MyString",
      :mensagem => "MyString"
    ).as_new_record)
  end

  it "renders new mensagen form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mensagens_path, "post" do
      assert_select "input#mensagen_remetente[name=?]", "mensagen[remetente]"
      assert_select "input#mensagen_destinatario[name=?]", "mensagen[destinatario]"
      assert_select "input#mensagen_assunto[name=?]", "mensagen[assunto]"
      assert_select "input#mensagen_mensagem[name=?]", "mensagen[mensagem]"
    end
  end
end
