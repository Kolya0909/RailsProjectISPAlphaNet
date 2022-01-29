class AddColumntToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :date, :string
  end
end
