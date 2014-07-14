require 'spec_helper'

describe "nota/edit" do
  before(:each) do
    @notum = assign(:notum, stub_model(Notum,
      :valor => "MyString"
    ))
  end

  it "renders the edit notum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notum_path(@notum), "post" do
      assert_select "input#notum_valor[name=?]", "notum[valor]"
    end
  end
end
