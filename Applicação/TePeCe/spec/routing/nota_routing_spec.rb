require "spec_helper"

describe NotaController do
  describe "routing" do

    it "routes to #index" do
      get("/nota").should route_to("nota#index")
    end

    it "routes to #new" do
      get("/nota/new").should route_to("nota#new")
    end

    it "routes to #show" do
      get("/nota/1").should route_to("nota#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nota/1/edit").should route_to("nota#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nota").should route_to("nota#create")
    end

    it "routes to #update" do
      put("/nota/1").should route_to("nota#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nota/1").should route_to("nota#destroy", :id => "1")
    end

  end
end
