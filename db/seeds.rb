#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SocialInsurance.create(:label => "Pflegeversicherung", :percentage => 1.95)
SocialInsurance.create(:label => "Krankenversicherung", :percentage => 15.5)
SocialInsurance.create(:label => "Arbeitslosenversicherung", :percentage => 3.0)
SocialInsurance.create(:label => "Rentenversicherung", :percentage => 19.6)
SocialInsurance.create(:label => "Zusatzbeitrag Pflegeversicherung", :percentage => 0.25)
