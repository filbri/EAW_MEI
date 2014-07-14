require 'spec_helper'

describe "resolucaos/show" do
  before(:each) do
    @resolucao = assign(:resolucao, stub_model(Resolucao,
      :resposta => "Resposta",
      :exercicio_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Resposta/)
    rendered.should match(/1/)
  end
end
