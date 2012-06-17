require 'spec_helper'

describe "social_insurances/index" do
  before(:each) do
    assign(:social_insurances, [
      stub_model(SocialInsurance,
        :label => "Pflegeversicherung",
        :percentage => "9.99"
      ),
      stub_model(SocialInsurance,
        :label => "Krankenversicherung",
        :percentage => "9.99"
      )
    ])
  end

  it "renders a list of social_insurances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Krankenversicherung".to_s, :count => 1
    assert_select "tr>td", :text => "Pflegeversicherung".to_s, :count => 1
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
