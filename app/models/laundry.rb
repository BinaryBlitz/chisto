# == Schema Information
#
# Table name: laundries
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  description             :string           not null
#  logo                    :string
#  background_image        :string
#  category                :string           default("")
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  city_id                 :integer
#  minimum_order_price     :integer
#  minimum_collection_time :integer
#  order_processing_time   :integer
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  unconfirmed_email       :string
#  rating                  :float            default(0.0)
#  ratings_count           :integer          default(0)
#

class Laundry < ApplicationRecord
  belongs_to :city

  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :laundry_treatments, dependent: :destroy
  has_many :treatments, through: :laundry_treatments

  validates :category, inclusion: { in: %w(economy premium) }, allow_blank: true
  validates :name, :description, presence: true
  validates :city, presence: true

  validates :minimum_order_price,
            :minimum_collection_time,
            :order_processing_time,
            numericality: { greater_than: 0 }, allow_nil: true

  validates :background_image, presence: true
  validates :logo, presence: true

  accepts_nested_attributes_for :schedules, allow_destroy: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :background_image, ImageUploader
  mount_uploader :logo, LogoUploader

  def collection_date
    @collection_date ||= begin
      configure_business_hours
      Biz.time(5, :hours).after(Time.zone.now).in_time_zone.to_date
    end
  end

  def delivery_date
    @delivery_date ||= begin
      configure_business_hours
      Biz.time(30, :hours).after(Time.zone.now).in_time_zone.to_date
    end
  end

  def delivery_date_opens_at
    @delivery_date_opens_at ||= delivery_date_business_hours&.keys&.first
  end

  def delivery_date_closes_at
    @delivery_date_closes_at ||= delivery_date_business_hours&.values&.first
  end

  private

  def schedule
    @schedule ||= schedules.map(&:to_hash).inject({}, &:merge)
  end

  def configure_business_hours
    Biz.configure do |config|
      config.hours = schedule
      config.time_zone = Rails.application.config.time_zone
    end
  end

  def delivery_date_business_hours
    @delivery_date_business_hours ||= begin
      # Start weeks on Mondays
      number_of_the_day = (delivery_date.wday + 6) % 7
      # Get the name (:mon)
      day_of_the_week = Schedule::DAYS_OF_THE_WEEK[number_of_the_day]
      # { '9:00' => '18:00' }
      schedule[day_of_the_week]
    end
  end
end
