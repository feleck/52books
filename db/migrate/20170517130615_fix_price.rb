class FixPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :price, :decimal, precision: 8, scale: 2
  end
end
