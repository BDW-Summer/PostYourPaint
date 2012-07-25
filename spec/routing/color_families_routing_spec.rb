require "spec_helper"

describe ColorFamiliesController do
  describe "routing" do

    it "routes to #index" do
      get("/color_families").should route_to("color_families#index")
    end

    it "routes to #new" do
      get("/color_families/new").should route_to("color_families#new")
    end

    it "routes to #show" do
      get("/color_families/1").should route_to("color_families#show", :id => "1")
    end

    it "routes to #edit" do
      get("/color_families/1/edit").should route_to("color_families#edit", :id => "1")
    end

    it "routes to #create" do
      post("/color_families").should route_to("color_families#create")
    end

    it "routes to #update" do
      put("/color_families/1").should route_to("color_families#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/color_families/1").should route_to("color_families#destroy", :id => "1")
    end

  end
end
