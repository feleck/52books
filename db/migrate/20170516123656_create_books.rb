class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.date :pruchase_date
      t.text :opinion
      t.decimal :price

      t.timestamps
    end
  end
end
