class Spare < ApplicationRecord
    has_many :boms
    has_many :equipment, through: :boms
    belongs_to :factory

    validates :code, presence: true
    validates :description, presence: true
    validates :qty, presence: true
    validates :qty, numericality: true
    validates :code, uniqueness: true
end
