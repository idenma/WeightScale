class RemoveNameFromTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :tables, :name, :string
  end
end
