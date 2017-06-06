class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  belongs_to :bookstore

  validates :bookstore, presence: true
  validates :price, presence: true
  validates :title, presence: true

  scope :read, -> { where(read: true).where.not(finish_reading_date: nil) }
  scope :started_reading, -> { where.not(start_reading_date: nil).where(read: false) }

  accepts_nested_attributes_for :book_authors, allow_destroy: true
end
