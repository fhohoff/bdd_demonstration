#encoding: utf-8
class SocialInsurancesController < ApplicationController
  def index
    @social_insurances = SocialInsurance.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @social_insurances }
    end
  end

  def edit
    @social_insurance = SocialInsurance.find(params[:id])
  end

  def update
    @social_insurance = SocialInsurance.find(params[:id])
    respond_to do |format|
      if @social_insurance.update_attributes(params[:social_insurance])
        format.html { redirect_to social_insurances_path, notice: 'Der Beitragssatz der ' + @social_insurance.label + ' wurde erfolgreich auf ' + @social_insurance.percentage.to_s + ' % geändert!'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @social_insurance.errors, status: :unprocessable_entity }
      end
    end
  end
end