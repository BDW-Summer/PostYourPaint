require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {"Post Your Paint"}

  describe "Home page" do
    it "should have the h1 'Paint App'" do
        visit '/static_pages/home'
        page.should have_selector('h1', :text => 'Paint App')
#       Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
    end
    it "should have the title 'Home'" do 
        visit '/static_pages/home'
        page.should have_selector('title',
                    :text => "#{base_title} | Home")
    end
  end
  
  describe "Faq page" do
    it "should have the h1 'FAQ'" do
        visit '/static_pages/faq'
        page.should have_selector('h1', :text => 'FAQ')
    end
    it "should have the title 'FAQ'" do 
        visit '/static_pages/faq'
        page.should have_selector('title',
                    :text => "#{base_title} | FAQ")
    end
  end

  describe "About page" do
    it "should have the h1 'About'" do
        visit '/static_pages/about'
        page.should have_selector('h1', :text => 'About')
    end
    it "should have the title 'About'" do 
        visit '/static_pages/about'
        page.should have_selector('title',
                    :text => "#{base_title} | About")
    end
  end
end
