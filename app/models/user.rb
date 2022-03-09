class User < ApplicationRecord
    has_many :reservations
    has_many :restaurants, through: :reservations
    has_secure_password

    validates :username, presence: true, uniqueness: true, length: {in: 2..20}
    validates :password, length: {in: 6..10}
end