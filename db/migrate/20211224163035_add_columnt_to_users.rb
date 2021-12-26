class AddColumntToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :routers, :text
  end
end
