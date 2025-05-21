class Stakeholder < ApplicationRecord
  belongs_to :buyer

  validates :name, :position, :linkedin, presence: true
end
