require "spec_helper"

describe SocialInsurancesController do
  describe "routing" do

    it "routes to #index" do
      get("admin/social_insurances").should route_to("social_insurances#index")
    end

    it "routes to #edit" do
      get("admin/social_insurances/1/edit").should route_to("social_insurances#edit", :id => "1")
    end

    it "routes to #update" do
      put("admin/social_insurances/1").should route_to("social_insurances#update", :id => "1")
    end

  end
end
