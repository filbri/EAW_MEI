require "spec_helper"

describe MensagensController do
  describe "routing" do

    it "routes to #index" do
      get("/mensagens").should route_to("mensagens#index")
    end

    it "routes to #new" do
      get("/mensagens/new").should route_to("mensagens#new")
    end

    it "routes to #show" do
      get("/mensagens/1").should route_to("mensagens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mensagens/1/edit").should route_to("mensagens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mensagens").should route_to("mensagens#create")
    end

    it "routes to #update" do
      put("/mensagens/1").should route_to("mensagens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mensagens/1").should route_to("mensagens#destroy", :id => "1")
    end

  end
end
