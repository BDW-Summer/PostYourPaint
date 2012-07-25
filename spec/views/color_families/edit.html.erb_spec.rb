require 'spec_helper'

describe "color_families/edit" do
  before(:each) do
    @color_family = assign(:color_family, stub_model(ColorFamily,
      :family => "MyString"
    ))
  end

  it "renders the edit color_family form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => color_families_path(@color_family), :method => "post" do
      assert_select "input#color_family_family", :name => "color_family[family]"
    end
  end
end
