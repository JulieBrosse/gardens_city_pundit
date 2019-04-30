class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gardens
  has_many :bookings, through: :gardens

#POUR GEOLOCALISER L'UTILISATEUR :


 #>> D'ABORD ESSAYER AVEC L'ENTREE D'UNE addressE PUIS AVEC GEOLOCALISATION

#unless :address.valid?
#  geocoded_by :ip_address,
#  :latitude => :lat, :longitude => :lon
#  after_validation :geocode
#else

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
#end

end
