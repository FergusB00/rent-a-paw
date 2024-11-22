class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address

  include PgSearch::Model
  pg_search_scope :search_by_breed_and_address,
  against: [ :breed, :address ],
  using: {
    tsearch: { prefix: true }
  }

  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :price, presence: true
  validates :size, presence: true, inclusion: { in: %w[Extra-Small Small Medium Large Extra-Large] }
  validates :description, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
