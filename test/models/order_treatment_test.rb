# == Schema Information
#
# Table name: order_treatments
#
#  id                   :integer          not null, primary key
#  order_item_id        :integer
#  laundry_treatment_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  price                :integer          not null
#  treatment_id         :integer
#

require 'test_helper'

class OrderTreatmentTest < ActiveSupport::TestCase
  setup do
   @order_treatment = order_treatments(:order_treatment)
   @laundry_treatment = @order_treatment.laundry_treatment
 end

  test 'valid' do
    assert @order_treatment.valid?
  end

  test 'treatment belongs to laundry' do
    another_laundry = laundries(:disabled_laundry)
    @laundry_treatment.laundry = another_laundry

    assert @order_treatment.invalid?
  end
end
