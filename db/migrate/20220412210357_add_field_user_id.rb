class AddFieldUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :used_routers, :user_id, :integer
  end
end
