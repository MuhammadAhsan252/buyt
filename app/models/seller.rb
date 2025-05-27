class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_photo
  has_many :testimonials, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_many :conversations, dependent: :destroy
  has_many :messages, as: :sender, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
