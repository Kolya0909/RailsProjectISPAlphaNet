class AddColumnToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :router, :text
  end
end
