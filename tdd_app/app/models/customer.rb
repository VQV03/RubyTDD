class Customer < ApplicationRecord
    validates :name, :email, :smoker, :phone, :avatar, presence: true
end
