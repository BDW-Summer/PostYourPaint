require 'spec_helper'

describe "color_families/index" do
  before(:each) do
    assign(:color_families, [
      stub_model(ColorFamily,
        :family => "Family"
      ),
      stub_model(ColorFamily,
        :family => "Family"
      )
    ])
  end

  it "renders a list of color_families" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Family".to_s, :count => 2
  end
end
