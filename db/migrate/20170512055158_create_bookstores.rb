class CreateBookstores < ActiveRecord::Migration[5.1]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
