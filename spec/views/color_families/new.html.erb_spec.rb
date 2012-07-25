require 'spec_helper'

describe "color_families/new" do
  before(:each) do
    assign(:color_family, stub_model(ColorFamily,
      :family => "MyString"
    ).as_new_record)
  end

  it "renders new color_family form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => color_families_path, :method => "post" do
      assert_select "input#color_family_family", :name => "color_family[family]"
    end
  end
end
