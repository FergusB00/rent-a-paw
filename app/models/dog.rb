class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :breed, presence: true
  validates :age, presence: true
  validates :price, presence: true
  validates :size, presence: true, inclusion: { in: %w[Extra-Small Small Medium Large Extra-Large] }
  validates :description, presence: true
end
