class CreateUseRouters < ActiveRecord::Migration[6.1]
  def change
    create_table :use_routers do |t|
      t.string :name
      t.string :model
      t.string :count
      t.string :type
      t.string :prymitka

      t.timestamps
    end
  end
end
