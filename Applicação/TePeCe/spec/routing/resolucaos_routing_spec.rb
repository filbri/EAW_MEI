require "spec_helper"

describe ResolucaosController do
  describe "routing" do

    it "routes to #index" do
      get("/resolucaos").should route_to("resolucaos#index")
    end

    it "routes to #new" do
      get("/resolucaos/new").should route_to("resolucaos#new")
    end

    it "routes to #show" do
      get("/resolucaos/1").should route_to("resolucaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resolucaos/1/edit").should route_to("resolucaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resolucaos").should route_to("resolucaos#create")
    end

    it "routes to #update" do
      put("/resolucaos/1").should route_to("resolucaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resolucaos/1").should route_to("resolucaos#destroy", :id => "1")
    end

  end
end
