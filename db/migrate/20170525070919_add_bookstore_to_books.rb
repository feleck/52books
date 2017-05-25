class AddBookstoreToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :bookstore, foreign_key: true
  end
end
