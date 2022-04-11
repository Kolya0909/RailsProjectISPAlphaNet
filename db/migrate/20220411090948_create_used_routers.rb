class CreateUsedRouters < ActiveRecord::Migration[6.1]
  def change
    create_table :used_routers do |t|
      t.string :name
      t.string :model
      t.string :count
      t.string :info_about_router
      t.string :description
      t.timestamps
    end
  end
end
