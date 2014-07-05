require 'spec_helper'

describe "profs/show" do
  before(:each) do
    @prof = assign(:prof, stub_model(Prof,
      :nome => "Nome",
      :nBI => 1,
      :morada => "Morada",
      :cp => "Cp",
      :localidade => "Localidade",
      :email => "Email",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/1/)
    rendered.should match(/Morada/)
    rendered.should match(/Cp/)
    rendered.should match(/Localidade/)
    rendered.should match(/Email/)
    rendered.should match(/2/)
  end
end
