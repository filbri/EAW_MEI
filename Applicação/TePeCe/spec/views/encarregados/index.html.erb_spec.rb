require 'spec_helper'

describe "encarregados/index" do
  before(:each) do
    assign(:encarregados, [
      stub_model(Encarregado,
        :nome => "Nome",
        :nBI => 1,
        :morada => "Morada",
        :cp => "Cp",
        :localidade => "Localidade",
        :email => "Email",
        :user_id => 2
      ),
      stub_model(Encarregado,
        :nome => "Nome",
        :nBI => 1,
        :morada => "Morada",
        :cp => "Cp",
        :localidade => "Localidade",
        :email => "Email",
        :user_id => 2
      )
    ])
  end

  it "renders a list of encarregados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Morada".to_s, :count => 2
    assert_select "tr>td", :text => "Cp".to_s, :count => 2
    assert_select "tr>td", :text => "Localidade".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
