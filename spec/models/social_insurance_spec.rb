require 'spec_helper'

describe SocialInsurance do

 before(:each) do
  @SocialInsurance = FactoryGirl.create(:health_insurance)
 end

 describe "validations" do
  context "given a valid percentage of a social_insurance" do
    it "has a percentage between 0.2 and 30" do
    @SocialInsurance.percentage = 30
    @SocialInsurance.should have(:no).errors_on(:percentage)

    @SocialInsurance.percentage = 0.2
    @SocialInsurance.should have(:no).errors_on(:percentage)
   end
  end
  context "given a invalid percentage of a social_insurance" do
   it "has a percentage with 0" do
    @SocialInsurance.percentage = 0
    @SocialInsurance.should have(1).error_on(:percentage)
   end

   it "has a percentage over 30" do
    @SocialInsurance.percentage = 35
    @SocialInsurance.should have(1).error_on(:percentage)
   end
  end
 end
end
