require 'spec_helper'

describe "turmas/edit" do
  before(:each) do
    @turma = assign(:turma, stub_model(Turma,
      :designacao => "MyString"
    ))
  end

  it "renders the edit turma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", turma_path(@turma), "post" do
      assert_select "input#turma_designacao[name=?]", "turma[designacao]"
    end
  end
end
