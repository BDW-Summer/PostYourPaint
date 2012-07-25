require 'spec_helper'

describe Paint do

    let(:user) { FactoryGirl.create(:user) }
    before { @paint = user.paints.build(# color_family: "Reds",
                                        family_id: @color_family.id,
                                        name: "Royal Red", 
                                        hex: "FF0022", 
                                        location: "80304", 
                                        quantity: "2",
                                        additional_info: "Yeah this is some legit paint. You should hop on this before it gets snatched up") }
    
    subject { @paint }
    
    it { should respond_to(:color_family) }
    it { should respond_to(:name) }
    it { should respond_to(:hex) }
    it { should respond_to(:location) }
    it { should respond_to(:quantity) }
    it { should respond_to(:additional_info) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    it { should respond_to(:family_id) }
    its(:user) { should == user }
    
    it { should be_valid }
    
    describe "accessible attributes" do 
        it "should not allow access to user_id" do 
            expect do 
                Paint.new(user_id: user.id)
            end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
        end
    end

    describe "when user_id is not present" do 
        before { @paint.user_id = nil }
        it { should_not be_valid }
    end
    
    describe "with blank content" do 
        before { @paint.name = " " }
        it { should_not be_valid }
    end
    
    it "should require a color_family" do 
        before { @paint.family_id = nil }
        it { should_not be_valid }
    end
end
