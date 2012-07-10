require 'spec_helper'

describe "User pages" do

  subject { page }
  
  describe "index" do 

    let(:user) { FactoryGirl.create(:user) }

    before(:all) { 30.times { FactoryGirl.create(:user) } }
    after(:all)  { User.delete_all }

    before(:each) do
      sign_in user
      visit users_path
    end
    
    it { should have_selector('title',  text: 'All users') }
    it { should have_selector('h1',     text: 'All users') }
    
    describe "pagination" do 
        
        it { should have_selector('div.pagination') }

        it "should list each user" do 
            User.paginate(page: 1).each do |user|
                page.should have_selector('li', text: user.email)
            end
        end  
    end  
    describe "delete links" do
        it { should_not have_link('delete') }
        
        describe "as an admin user" do 
            let(:admin) { FactoryGirl.create(:admin) }
            before do 
                sign_in admin
                visit users_path
            end
            
            it { should have_link('delete', href: user_path(User.first)) }
            it "should be able to delete another user" do
                expect { click_link('delete') }.to change(User, :count).by(-1) 
            end
            it { should_not have_link('delete', href: user_path(admin)) }
        end
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:paint,  user: user, color_family: "Reds", name: "Royal Red", hex: "FF0022", location: 80304, quantity: 2, additional_info: "Yeah this is some legit paint. You should hop on this before it gets snatched up") }
    let!(:p2) { FactoryGirl.create(:paint,  user: user, color_family: "Reds", name: "Royal Red", hex: "FF0022", location: 80304, quantity: 2, additional_info: "Yeah this is some legit paint. You should hop on this before it gets snatched up") }
    
    before { visit user_path(user) }
    
    it { should have_selector('h1',    text: user.email) }
    it { should have_selector('title', text: user.email) }
    
    describe "paints" do 
        it { should have_content(p1.color_family) }
        it { should have_content(p1.name) }
        it { should have_content(p1.hex) }
        it { should have_content(p1.location) }
        it { should have_content(p1.quantity) }
        it { should have_content(p1.additional_info) }
        it { should have_content(p2.color_family) }
        it { should have_content(p2.name) }
        it { should have_content(p2.hex) }
        it { should have_content(p2.location) }
        it { should have_content(p2.quantity) }
        it { should have_content(p2.additional_info) }
        it { should have_content(user.paints.count) }
    end
  end
  
  describe "signup page" do
    before { visit signup_path }
    
    let(:submit) { "Create my account" }
    
    describe "with invalid information" do 
        
        it "should not create a user" do 
            expect { click_button submit}.not_to change(User, :count)
        end
        
        describe "after submission" do 
            before { click_button submit }
            
            it { should have_selector('title', text: 'Sign up') }
            it { should have_content('error') }
        end
        
    end
    
    describe "with valid information" do 
        before do 
            fill_in "Email",         with: "user@example.com"
            fill_in "Password",      with: "foobar"
            fill_in "Confirmation",  with: "foobar"
        end
        
        it "should create a user" do 
            expect { click_button submit}.to change(User, :count).by(1)
        end
        
        describe "after saving the user" do 
            before { click_button submit }
            let(:user) { User.find_by_email('user@example.com')}

            it { should have_selector('title', text: user.email) }
            it { should have_selector('div.alert.alert-success', text: 'Welcome') }
            it { should have_link('Sign out') }
        end
    end
    
    describe "edit" do 
        let(:user) { FactoryGirl.create(:user) }
        before do 
            sign_in user
            visit edit_user_path(user)
        end
        
        describe "page" do 
            it { should have_selector('h1',     text: "Update your profile") }
            it { should have_selector('title',  text: "Edit user") }
        end
        describe "with invalid information" do 
            before { click_button "Save changes" }
            
            it { should have_content('error') }
        end
        
        describe "with valid information" do 
            let(:new_email) { "new@example.com" }
            
            before do 
                fill_in "Email",            with: new_email
                fill_in "Password",         with: user.password 
                fill_in "Confirm Password", with: user.password 
                click_button "Save changes"
            end
            
            it { should have_selector('title', text: new_email) }
            it { should have_selector('div.alert.alert-success') }
            it { should have_link('Sign out', href: signout_path) }
            specify { user.reload.email.should == new_email}
        end
    end
end
end