FactoryGirl.define do
 factory :nurse_care_insurance, :class => SocialInsurance do
   label "Pflegeversicherung"
   percentage 1.95
 end


 factory :health_insurance, :class => SocialInsurance do
   label "Krankenversicherung"
   percentage 15.5
 end
 factory :unemployment_insurance, :class => SocialInsurance do
   label "Arbeitslosenversicherung"
   percentage 3.00
 end
 factory :pension_insurance, :class => SocialInsurance do
   label "Rentenversicherung"
   percentage 19.6
 end
 factory :additional_nurse_care_insurance, :class => SocialInsurance do
   label "Zusatzbeitrag Pflegeversicherung"
   percentage 0.25
 end




end
