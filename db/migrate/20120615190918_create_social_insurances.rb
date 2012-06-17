class CreateSocialInsurances < ActiveRecord::Migration
  def change
    create_table :social_insurances do |t|
      t.string :label
      t.decimal :percentage

      t.timestamps
    end
  end
end
