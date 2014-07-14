require 'spec_helper'

describe "nota/show" do
  before(:each) do
    @notum = assign(:notum, stub_model(Notum,
      :valor => "Valor"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Valor/)
  end
end
