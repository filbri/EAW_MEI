require "spec_helper"

describe DirecsController do
  describe "routing" do

    it "routes to #index" do
      get("/direcs").should route_to("direcs#index")
    end

    it "routes to #new" do
      get("/direcs/new").should route_to("direcs#new")
    end

    it "routes to #show" do
      get("/direcs/1").should route_to("direcs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/direcs/1/edit").should route_to("direcs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/direcs").should route_to("direcs#create")
    end

    it "routes to #update" do
      put("/direcs/1").should route_to("direcs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/direcs/1").should route_to("direcs#destroy", :id => "1")
    end

  end
end
