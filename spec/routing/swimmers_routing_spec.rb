require "spec_helper"

describe SwimmersController do
  describe "routing" do

    it "routes to #index" do
      get("/swimmers").should route_to("swimmers#index")
    end

    it "routes to #new" do
      get("/swimmers/new").should route_to("swimmers#new")
    end

    it "routes to #show" do
      get("/swimmers/1").should route_to("swimmers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/swimmers/1/edit").should route_to("swimmers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/swimmers").should route_to("swimmers#create")
    end

    it "routes to #update" do
      put("/swimmers/1").should route_to("swimmers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/swimmers/1").should route_to("swimmers#destroy", :id => "1")
    end

  end
end
