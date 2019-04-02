class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :bookings, through: :gardens

#POUR GEOLOCALISER L'UTILISATEUR :

#  geocoded_by :ip_address,
#  :latitude => :lat, :longitude => :lon
#  after_validation :geocode
end
