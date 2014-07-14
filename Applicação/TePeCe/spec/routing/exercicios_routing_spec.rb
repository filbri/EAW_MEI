require "spec_helper"

describe ExerciciosController do
  describe "routing" do

    it "routes to #index" do
      get("/exercicios").should route_to("exercicios#index")
    end

    it "routes to #new" do
      get("/exercicios/new").should route_to("exercicios#new")
    end

    it "routes to #show" do
      get("/exercicios/1").should route_to("exercicios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/exercicios/1/edit").should route_to("exercicios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/exercicios").should route_to("exercicios#create")
    end

    it "routes to #update" do
      put("/exercicios/1").should route_to("exercicios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/exercicios/1").should route_to("exercicios#destroy", :id => "1")
    end

  end
end
