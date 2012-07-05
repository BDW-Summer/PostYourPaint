require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before {visit root_path}
  
    it { should have_selector('h1', text: 'Paint App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector('title', text: '| Home')}
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
