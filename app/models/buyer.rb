class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_photo
  has_many :stakeholders, dependent: :destroy
  accepts_nested_attributes_for :stakeholders, reject_if: :all_blank, allow_destroy: true
end
