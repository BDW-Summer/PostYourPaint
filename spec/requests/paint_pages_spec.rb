require 'spec_helper'

describe "Paint Pages" do

    subject { page }
    
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }
    
    describe "paint creation" do 
        before { visit root_path }
        
        describe "with invalid information" do 
        
            it "should not create a paint" do 
                expect { click_button "Post" }.should_not change(Paint, :count)
            end
            
            describe "error messages" do 
                before { click_button "Post" }
                it { should have_content('error') }
            end
        end
        
        describe "with valid information" do 
        
            before { fill_in 'paint_color_family', with: "Reds" }
            before { fill_in 'paint_name', with: "Another Red" }
            before { fill_in 'paint_hex', with: "002211" }
            before { fill_in 'paint_location', with: "80303" }
            before { fill_in 'paint_quantity', with: "5" }
            before { fill_in 'paint_additional_info', with: "I added some info here" }
            it "should create a paint" do 
                expect { click_button "Post" }.should change(Paint, :count).by(1)
            end
        end
    end
    
    describe "paint destruction" do 
        before { FactoryGirl.create(:paint, user:user) }
        
        describe "as correct user" do
            before { visit root_path }
            
            it "should delete a paint" do 
                expect { click_link "delete" }.should change(Paint, :count).by(-1)
            end           
        end
    end
end
