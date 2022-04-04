class User < ApplicationRecord
    has_many :reservations
    has_many :favorites

    has_many :restaurants, through: :reservations
    has_many :restaurants, through: :favorites
    has_secure_password

    validates :username, presence: true, uniqueness: true, length: {in: 2..20}
end