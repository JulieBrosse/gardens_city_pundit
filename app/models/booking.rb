class Booking < ApplicationRecord
  belongs_to :garden
  belongs_to :booker, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_many :users, through: :gardens
end
