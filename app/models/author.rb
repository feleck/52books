class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  #accepts_nested_attributes_for :books, allow_destroy: true

  def full_name
    [first_name, last_name].join(' ') if first_name && last_name
  end
end
