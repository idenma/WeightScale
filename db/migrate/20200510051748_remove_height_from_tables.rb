class RemoveHeightFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :tables, :height, :decimal
  end
end
