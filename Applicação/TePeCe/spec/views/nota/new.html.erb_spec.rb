require 'spec_helper'

describe "nota/new" do
  before(:each) do
    assign(:notum, stub_model(Notum,
      :valor => "MyString"
    ).as_new_record)
  end

  it "renders new notum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nota_path, "post" do
      assert_select "input#notum_valor[name=?]", "notum[valor]"
    end
  end
end
