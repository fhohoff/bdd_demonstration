require 'spec_helper'

describe CalculatorController do

  before(:each) do
   FactoryGirl.create(:health_insurance)
   FactoryGirl.create(:nurse_care_insurance)
   FactoryGirl.create(:unemployment_insurance)
   FactoryGirl.create(:pension_insurance)
   FactoryGirl.create(:additional_nurse_care_insurance)
 end

  describe "GET 'input'" do
    it "returns http success" do
      get 'input'
      response.should be_success
    end
  end

  describe "POST 'output'" do
    it "returns http success" do
      post 'output', {:age => 23, :gross_salary => 3000, :have_children => false}
      response.should be_success
    end
  end


end
