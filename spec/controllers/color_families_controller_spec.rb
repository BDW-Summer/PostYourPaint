require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ColorFamiliesController do

  # This should return the minimal set of attributes required to create a valid
  # ColorFamily. As you add validations to ColorFamily, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ColorFamiliesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all color_families as @color_families" do
      color_family = ColorFamily.create! valid_attributes
      get :index, {}, valid_session
      assigns(:color_families).should eq([color_family])
    end
  end

  describe "GET show" do
    it "assigns the requested color_family as @color_family" do
      color_family = ColorFamily.create! valid_attributes
      get :show, {:id => color_family.to_param}, valid_session
      assigns(:color_family).should eq(color_family)
    end
  end

  describe "GET new" do
    it "assigns a new color_family as @color_family" do
      get :new, {}, valid_session
      assigns(:color_family).should be_a_new(ColorFamily)
    end
  end

  describe "GET edit" do
    it "assigns the requested color_family as @color_family" do
      color_family = ColorFamily.create! valid_attributes
      get :edit, {:id => color_family.to_param}, valid_session
      assigns(:color_family).should eq(color_family)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ColorFamily" do
        expect {
          post :create, {:color_family => valid_attributes}, valid_session
        }.to change(ColorFamily, :count).by(1)
      end

      it "assigns a newly created color_family as @color_family" do
        post :create, {:color_family => valid_attributes}, valid_session
        assigns(:color_family).should be_a(ColorFamily)
        assigns(:color_family).should be_persisted
      end

      it "redirects to the created color_family" do
        post :create, {:color_family => valid_attributes}, valid_session
        response.should redirect_to(ColorFamily.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved color_family as @color_family" do
        # Trigger the behavior that occurs when invalid params are submitted
        ColorFamily.any_instance.stub(:save).and_return(false)
        post :create, {:color_family => {}}, valid_session
        assigns(:color_family).should be_a_new(ColorFamily)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ColorFamily.any_instance.stub(:save).and_return(false)
        post :create, {:color_family => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested color_family" do
        color_family = ColorFamily.create! valid_attributes
        # Assuming there are no other color_families in the database, this
        # specifies that the ColorFamily created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ColorFamily.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => color_family.to_param, :color_family => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested color_family as @color_family" do
        color_family = ColorFamily.create! valid_attributes
        put :update, {:id => color_family.to_param, :color_family => valid_attributes}, valid_session
        assigns(:color_family).should eq(color_family)
      end

      it "redirects to the color_family" do
        color_family = ColorFamily.create! valid_attributes
        put :update, {:id => color_family.to_param, :color_family => valid_attributes}, valid_session
        response.should redirect_to(color_family)
      end
    end

    describe "with invalid params" do
      it "assigns the color_family as @color_family" do
        color_family = ColorFamily.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ColorFamily.any_instance.stub(:save).and_return(false)
        put :update, {:id => color_family.to_param, :color_family => {}}, valid_session
        assigns(:color_family).should eq(color_family)
      end

      it "re-renders the 'edit' template" do
        color_family = ColorFamily.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ColorFamily.any_instance.stub(:save).and_return(false)
        put :update, {:id => color_family.to_param, :color_family => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested color_family" do
      color_family = ColorFamily.create! valid_attributes
      expect {
        delete :destroy, {:id => color_family.to_param}, valid_session
      }.to change(ColorFamily, :count).by(-1)
    end

    it "redirects to the color_families list" do
      color_family = ColorFamily.create! valid_attributes
      delete :destroy, {:id => color_family.to_param}, valid_session
      response.should redirect_to(color_families_url)
    end
  end

end
