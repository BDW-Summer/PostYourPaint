require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before {visit root_path}
  
    it { should have_selector('h1', text: 'Paint App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector('title', text: '| Home')}
  
    describe "for signed-in users" do 
        let(:user) { FactoryGirl.create(:user) }
        before do 
            FactoryGirl.create(:paint, user: user,
                                       color_family: "Blues",
                                       name: "Ice Blue",
                                       hex: "FF8899",
                                       location: 80453,
                                       quantity: 4,
                                       additional_info: "Yeah I guess it's Behr")
            FactoryGirl.create(:paint, user: user,
                                       color_family: "Whites",
                                       name: "Hulk Green",
                                       hex: "FF8899",
                                       location: 80432,
                                       quantity: 1,
                                       additional_info: "100% Hulk Green. Don't Hulk out.")
            sign_in user
            visit root_path
        end
        
        it "should render the user's inventory" do 
            user.inventory.each do |item|
                page.should have_selector("li##{item.id}", text: item.color_family) 
                page.should have_selector("li##{item.id}", text: item.name) 
                page.should have_selector("li##{item.id}", text: item.hex) 
                page.should have_selector("li##{item.id}", text: item.location) 
                page.should have_selector("li##{item.id}", text: item.quantity) 
                page.should have_selector("li##{item.id}", text: item.additional_info)
            end 
        end
    end
  end
  
  describe "Faq page" do
    before {visit faq_path}
  
    it { should have_selector('h1', text: 'FAQ')}
    it { should have_selector('title', text: full_title('FAQ'))}
  end

  describe "About page" do
    before {visit about_path}
  
    it { should have_selector('h1', text: 'About')}
    it { should have_selector('title', text: full_title('About'))}
  end

  describe "Terms page" do
    before {visit terms_path}
  
    it { should have_selector('h1', text: 'Terms')}
    it { should have_selector('title', text: full_title('Terms'))}
  end
  
end
