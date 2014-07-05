require "spec_helper"

describe EncarregadosController do
  describe "routing" do

    it "routes to #index" do
      get("/encarregados").should route_to("encarregados#index")
    end

    it "routes to #new" do
      get("/encarregados/new").should route_to("encarregados#new")
    end

    it "routes to #show" do
      get("/encarregados/1").should route_to("encarregados#show", :id => "1")
    end

    it "routes to #edit" do
      get("/encarregados/1/edit").should route_to("encarregados#edit", :id => "1")
    end

    it "routes to #create" do
      post("/encarregados").should route_to("encarregados#create")
    end

    it "routes to #update" do
      put("/encarregados/1").should route_to("encarregados#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/encarregados/1").should route_to("encarregados#destroy", :id => "1")
    end

  end
end
