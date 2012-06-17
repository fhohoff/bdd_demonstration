require "spec_helper"

describe CalculatorController do
  describe "routing" do

    it "routes to #input" do
      get("calculator/input").should route_to("calculator#input")
    end

    it "routes to #output" do
      post("calculator/output").should route_to("calculator#output")
    end

  end
end
