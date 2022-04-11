class AddFieldListIdToUsedRouter < ActiveRecord::Migration[6.1]
  def change
    add_column :used_routers, :list_id, :integer
  end
end
