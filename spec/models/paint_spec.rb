require 'spec_helper'

describe Paint do

    let(:user) { FactoryGirl.create(:user) }
    before { @paint = user.paints.build(color_family: "Reds", name: "Royal Red", hex: "FF0022", location: "80304", quantity: "2", additional_info: "Yeah this is some legit paint. You should hop on this before it gets snatched up") }
    
    subject { @paint }
    
    it { should respond_to(:color_family) }
    it { should respond_to(:name) }
    it { should respond_to(:hex) }
    it { should respond_to(:location) }
    it { should respond_to(:quantity) }
    it { should respond_to(:additional_info) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
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
    
    describe "when color_family is not present" do
        before { @paint.color_family = " " }
        it { should_not be_valid }
    end

    describe "when name is not present" do
        before { @paint.name = " " }
        it { should_not be_valid }
    end
    describe "when hex is not present" do
        before { @paint.hex = " " }
        it { should_not be_valid }
    end
    describe "when location is not present" do
        before { @paint.location = " " }
        it { should_not be_valid }
    end
    describe "when quantity is not present" do
        before { @paint.quantity = " " }
        it { should_not be_valid }
    end
    describe "when additional_info is not present" do
        before { @paint.additional_info = " " }
        it { should_not be_valid }
    end

    describe "accessible attributes" do 
        it "should allow access to user_id" do 
            expect do 
                Paint.new(user_id: user.id)
            end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
        end
    end
end
