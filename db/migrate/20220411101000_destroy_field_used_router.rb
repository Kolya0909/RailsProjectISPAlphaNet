class DestroyFieldUsedRouter < ActiveRecord::Migration[6.1]
  def change
    remove_column :used_routers, :list_id
  end
end
