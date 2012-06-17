require 'spec_helper'

describe "calculator/input.html.erb" do
  it "show the calculator form" do
    render
    assert_select "form", :action => output_path(:have_children => true, :age => 23, :gross_salary => 3000), :method => "post"
  end
end
