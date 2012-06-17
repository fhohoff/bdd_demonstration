require 'spec_helper'

describe "calculator/output.html.erb" do
  it "renders the outcome of the calculation" do
    render
    assert_select "tr>td", :text => "Krankenversicherung".to_s, :count => 1
    assert_select "tr>td", :text => "Pflegeversicherung".to_s, :count => 1   
  end
end
