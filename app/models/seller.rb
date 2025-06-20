class Seller < ApplicationRecord
  extend FriendlyId
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_photo
  has_many :testimonials, dependent: :destroy
  has_many :projects, dependent: :destroy

  has_many :conversations, dependent: :destroy
  has_many :messages, as: :sender, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 15}
  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/, message: "can only contain letters and numbers (no spaces or special characters)" }
  friendly_id :username, use: %i[slugged history]

  def should_generate_new_friendly_id?
    username_changed? || slug.blank?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
