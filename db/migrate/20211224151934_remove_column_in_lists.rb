class RemoveColumnInLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :date
  end
end
