require 'spec_helper'

describe "mensagens/index" do
  before(:each) do
    assign(:mensagens, [
      stub_model(Mensagen,
        :remetente => "Remetente",
        :destinatario => "Destinatario",
        :assunto => "Assunto",
        :mensagem => "Mensagem"
      ),
      stub_model(Mensagen,
        :remetente => "Remetente",
        :destinatario => "Destinatario",
        :assunto => "Assunto",
        :mensagem => "Mensagem"
      )
    ])
  end

  it "renders a list of mensagens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Remetente".to_s, :count => 2
    assert_select "tr>td", :text => "Destinatario".to_s, :count => 2
    assert_select "tr>td", :text => "Assunto".to_s, :count => 2
    assert_select "tr>td", :text => "Mensagem".to_s, :count => 2
  end
end
