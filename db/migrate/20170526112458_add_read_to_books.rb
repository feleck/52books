class AddReadToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :read, :boolean, default: false
  end
end
