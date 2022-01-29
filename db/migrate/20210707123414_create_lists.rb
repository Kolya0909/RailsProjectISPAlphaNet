class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :tel
      t.string :adress
      t.date :date
      t.string :works
      t.string :status
      t.string :team
      t.text :descr

      t.timestamps
    end
  end
end
