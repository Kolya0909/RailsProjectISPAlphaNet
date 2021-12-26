class CreateRouters < ActiveRecord::Migration[6.1]
  def change
    create_table :routers do |t|
      t.string :name
      t.string :model

      t.timestamps
    end
  end
end
