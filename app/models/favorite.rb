class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    #custom favorite method for controller use
    scope :favorite, -> { where(favorite: true) }
end
