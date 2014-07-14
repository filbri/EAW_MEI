require 'spec_helper'

describe "nota/index" do
  before(:each) do
    assign(:nota, [
      stub_model(Notum,
        :valor => "Valor"
      ),
      stub_model(Notum,
        :valor => "Valor"
      )
    ])
  end

  it "renders a list of nota" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Valor".to_s, :count => 2
  end
end
