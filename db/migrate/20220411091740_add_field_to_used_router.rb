class AddFieldToUsedRouter < ActiveRecord::Migration[6.1]
  def change
    add_column :used_routers, :time, :string
  end
end
