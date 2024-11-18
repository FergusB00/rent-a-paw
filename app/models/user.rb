class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :encrypted_password, length: { minimum: 5, too_short: "minimum is 5 characters" }
  validates :encrypted_password, length: { maximum: 50, too_long: "maximum is 50 characters" }
end
