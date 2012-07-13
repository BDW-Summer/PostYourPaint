require 'spec_helper'

describe "Paint pages" do

  subject { page }

  describe "paint_new page" do
    before { visit paint_new_path }

    it { should have_selector('h1',    text: 'Add Paint') }
    it { should have_selector('title', text: full_title('Add Paint')) }
  end
  
  describe "paint_new" do 
    
    before { visit paint_new_path }
    
    let(:submit) { "Add My Paint" }
    
    describe "with invalid information" do 
        it "should not create a paint" do 
            expect { click_button :submit }.not_to change(Paint, :count)
        end
    end
    
    describe "with valid information" do 
        before do 
            fill_in "Color family",         with: "Neon"
            fill_in "Name",                 with: "Brightness"
            fill_in "Hex",                  with: "FF00FF"
            fill_in "Location",             with: 80304
            fill_in "Quantity",             with: 2
            fill_in "Additional info",      with: "Yeah this is neon paint biatch"
        end
        
        it "should create a paint" do 
            expect { click_button submit }.to change(Paint, :count).by(1)
        end
    end
  end
end
