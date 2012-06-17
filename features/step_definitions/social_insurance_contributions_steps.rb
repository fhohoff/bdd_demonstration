#encoding: utf-8
Given /^I am on the calculate page$/ do
  visit input_path
end

Given /^I want to calculate with the social insurance percentages of (\d+)$/ do |arg1|
 FactoryGirl.create(:nurse_care_insurance)
 FactoryGirl.create(:additional_nurse_care_insurance)
 FactoryGirl.create(:health_insurance)
 FactoryGirl.create(:unemployment_insurance)
 FactoryGirl.create(:pension_insurance)
end



Given /^I am "(.*?)" old$/ do |years|
  fill_in "age", :with => years
end

Given /^I have "(.*?)" child \/ children$/ do |number_children|
 if number_children.to_i > 0
  check "have_children"
 else
  uncheck "have_children"
 end
end

When /^I enter "(.*?)" gross salary$/ do |salary|
 fill_in "gross_salary", :with => salary
end

When /^I click on "(.*?)"$/ do |calculate_button|
  click_button calculate_button
end


Then /^the outcome should be "(.*?)"$/ do |contributions|
 page.should have_content "Die Sozialversicherungsbeiträge betragen insgesamt: " + contributions
end

