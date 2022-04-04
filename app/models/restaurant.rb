class Restaurant < ApplicationRecord
    has_many :reservations
    has_many :favorites

    has_many :users, through: :reservations
    has_many :users, through: :favorites

end
