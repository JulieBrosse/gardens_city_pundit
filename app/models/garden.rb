class Garden < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :address, presence: true, uniqueness: true
  validates :title, presence: true

  belongs_to :user
  has_many :bookings, dependent: :destroy
end
