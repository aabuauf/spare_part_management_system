class Factory < ApplicationRecord
    has_many :users
    has_many :equipment
    has_many :spares, through: :equipment
    validates :name, presence: true
end
