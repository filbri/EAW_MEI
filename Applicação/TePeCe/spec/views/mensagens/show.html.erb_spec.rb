require 'spec_helper'

describe "mensagens/show" do
  before(:each) do
    @mensagen = assign(:mensagen, stub_model(Mensagen,
      :remetente => "Remetente",
      :destinatario => "Destinatario",
      :assunto => "Assunto",
      :mensagem => "Mensagem"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Remetente/)
    rendered.should match(/Destinatario/)
    rendered.should match(/Assunto/)
    rendered.should match(/Mensagem/)
  end
end
