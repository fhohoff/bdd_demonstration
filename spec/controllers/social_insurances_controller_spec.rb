require 'spec_helper'

describe SocialInsurancesController do
  before(:each) do
   FactoryGirl.create(:health_insurance)
   FactoryGirl.create(:nurse_care_insurance)
   FactoryGirl.create(:unemployment_insurance)
   FactoryGirl.create(:pension_insurance)
   FactoryGirl.create(:additional_nurse_care_insurance)
  end

  describe "GET index" do
    it "should render index of social insurance" do
      get :index
      social_insurances = SocialInsurance.all
      response.should render_template("index")
      assigns(:social_insurances).should eq(social_insurances) 
    end 
 end

   describe "GET edit" do
    it "should render edit form for health insurance" do
      social_insurance = SocialInsurance.find_by_label("Krankenversicherung")
      get :edit, {:id => social_insurance.to_param}
      assigns(:social_insurance).should eq(social_insurance)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested social_insurance" do
        social_insurance = SocialInsurance.find_by_label("Krankenversicherung")
        put :update, {:id => social_insurance.id, :social_insurance => {'percentage' => '3'}}
      end

      it "redirects to the social_insurances" do
        social_insurance = SocialInsurance.find_by_label("Pflegeversicherung")
        put :update, {:id => social_insurance.id, :social_insurance => {'percentage' => '5'}}
        response.should redirect_to(social_insurances_path)
      end
    end

    describe "with invalid params" do
      it "should render edit form" do
        social_insurance = SocialInsurance.find_by_label("Krankenversicherung")
#        SocialInsurance.any_instance.stub(:save).and_return(false)
        put :update, {:id => social_insurance.id, :social_insurance => {'percentage' => '55'}}
        response.should render_template("edit")
      end

    
    end
  end
end
