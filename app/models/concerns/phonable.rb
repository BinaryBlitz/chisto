# Phone number normalization and format validation
# Does not validate presence of the phone number
module Phonable
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_phone_number
    validates :phone_number, phone: true, allow_nil: true
  end

  private

  def normalize_phone_number
    return unless phone_number

    self.phone_number = Phonelib.parse(phone_number).e164
  end
end
