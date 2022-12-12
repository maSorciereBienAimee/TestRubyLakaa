class Indicator < ApplicationRecord
    has_many :Intermediaire, dependent: :destroy
    has_many :collects, through: :Intermediaire
end
