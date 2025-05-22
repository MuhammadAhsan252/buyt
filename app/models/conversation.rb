class Conversation < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  has_many :messages, dependent: :destroy
end
