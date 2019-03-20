class Booking < ApplicationRecord
  belongs_to :garden
  has_many :users, through: :gardens
end
