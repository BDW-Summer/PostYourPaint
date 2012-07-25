require 'spec_helper'

describe "color_families/show" do
  before(:each) do
    @color_family = assign(:color_family, stub_model(ColorFamily,
      :family => "Family"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Family/)
  end
end
