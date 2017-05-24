class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  accepts_nested_attributes_for :book_authors, allow_destroy: true
end
