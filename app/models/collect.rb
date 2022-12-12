class Collect < ApplicationRecord
    has_many :collect_indicators, dependent: :destroy
    has_many :indicators, through: :collect_indicators
end
