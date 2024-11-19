class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true, length: { maximum: 50 }
  # validates :last_name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 50 }, uniqueness: true

end
