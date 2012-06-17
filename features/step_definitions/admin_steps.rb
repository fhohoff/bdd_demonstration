#encoding: utf-8

Given /^I am on the admin page$/ do
 visit "/admin/social_insurances"
end

Given /^I want to update "(.*?)"$/ do |social_insurance|
 FactoryGirl.create(:health_insurance)
 FactoryGirl.create(:nurse_care_insurance)
 FactoryGirl.create(:additional_nurse_care_insurance)
 FactoryGirl.create(:unemployment_insurance)
 FactoryGirl.create(:pension_insurance)

 @social_insurance = SocialInsurance.find_by_label(social_insurance)
 insurance_path = "/admin/social_insurances/" + @social_insurance.id.to_s + "/edit"
 visit insurance_path

end

When /^I update the percentage to "(.*?)"$/ do |percentage|
 fill_in "social_insurance_percentage", :with => percentage
 click_button "Ändern"
end

Then /^I should see on the admin page "(.*?)" for "(.*?)"$/ do |percentage, social_insurance|
 page.should have_content "Der Beitragssatz der " + social_insurance + " wurde erfolgreich auf " + percentage  + " % geändert!"

end

Then /^I should receive an error$/ do

 page.should_not have_content "geändert!"


end


