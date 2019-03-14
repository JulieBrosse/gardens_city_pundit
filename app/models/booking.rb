class Booking < ApplicationRecord
  belongs_to :gardens
  has_many :users, through: :gardens
end
