require "spec_helper"

describe ProfsController do
  describe "routing" do

    it "routes to #index" do
      get("/profs").should route_to("profs#index")
    end

    it "routes to #new" do
      get("/profs/new").should route_to("profs#new")
    end

    it "routes to #show" do
      get("/profs/1").should route_to("profs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/profs/1/edit").should route_to("profs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/profs").should route_to("profs#create")
    end

    it "routes to #update" do
      put("/profs/1").should route_to("profs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/profs/1").should route_to("profs#destroy", :id => "1")
    end

  end
end
