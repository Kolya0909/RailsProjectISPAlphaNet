class DeletedField < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :router
  end
end
