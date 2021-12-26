class AddColumntToRouters < ActiveRecord::Migration[6.1]
  def change
    add_column :routers, :count, :integer
  end
end
