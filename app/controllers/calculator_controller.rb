#encoding: utf-8
class CalculatorController < ApplicationController
  def input
  end

  def output
    age = params[:age].to_i
    @gross_salary = params[:gross_salary].to_f
    have_children = params[:have_children]

    health_insurance_percentage = SocialInsurance.find_by_label("Krankenversicherung").percentage
    nursing_care_insurance_percentage = SocialInsurance.find_by_label("Pflegeversicherung").percentage
    additional_nursing_care_insurance_percentage = SocialInsurance.find_by_label("Zusatzbeitrag Pflegeversicherung").percentage
    unemployment_insurance_percentage = SocialInsurance.find_by_label("Arbeitslosenversicherung").percentage
    pension_insurance_percentage = SocialInsurance.find_by_label("Rentenversicherung").percentage

    sum_per = unemployment_insurance_percentage / 2
    sum_per += pension_insurance_percentage / 2
    sum_per += (health_insurance_percentage - 0.9)/ 2 + 0.9

    if(age.to_i >= 23 && !have_children)
      sum_per += nursing_care_insurance_percentage / 2 + additional_nursing_care_insurance_percentage
      @nursing_care_insurance_contribution = @gross_salary * (nursing_care_insurance_percentage / 2 + additional_nursing_care_insurance_percentage) / 100
      @info = "Zusätzlicher Pflegeversicherungssatz, da Sie über 22 Jahre alt und kinderlos sind."
    else
      sum_per += nursing_care_insurance_percentage / 2
      @nursing_care_insurance_contribution = @gross_salary * (nursing_care_insurance_percentage / 2) / 100
      @info = "Kein zusätzlicher Pflegeversicherungssatz, da Sie Kinder haben und/oder das 22. Lebensjahr noch nicht vollendet haben."
    end
    @health_insurance_contribution = @gross_salary * ((health_insurance_percentage - 0.9)/ 2 + 0.9)  / 100
    @unemployment_insurance_contribution = @gross_salary * (unemployment_insurance_percentage / 2) / 100
    @pension_insurance_contribution = @gross_salary * (pension_insurance_percentage / 2)  / 100
    @total_insurance_contributions = @gross_salary * sum_per / 100
    @net_salary = @gross_salary - @total_insurance_contributions
  end
end
