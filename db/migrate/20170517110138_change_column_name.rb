class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :pruchase_date, :purchase_date
  end
end
