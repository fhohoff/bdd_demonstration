require 'spec_helper'

describe "social_insurances/edit" do
  before(:each) do
    @social_insurance = assign(:social_insurance, stub_model(SocialInsurance,

      :percentage => "9.99"
    ))
  end

  it "renders the edit social_insurance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => social_insurances_path(@social_insurance), :method => "post" do
      assert_select "input#social_insurance_percentage", :name => "social_insurance[percentage]"
    end
  end
end
