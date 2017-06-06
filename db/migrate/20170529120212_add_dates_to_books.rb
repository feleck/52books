class AddDatesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :start_reading_date, :date, default: nil
    add_column :books, :finish_reading_date, :date, default: nil
  end
end
