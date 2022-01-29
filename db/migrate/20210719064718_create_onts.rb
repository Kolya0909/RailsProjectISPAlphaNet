class CreateOnts < ActiveRecord::Migration[6.1]
  def change
    create_table :onts do |t|
      t.integer :count
      t.string :team

      t.timestamps
    end
  end
end
