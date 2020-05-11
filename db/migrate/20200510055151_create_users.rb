class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.decimal :height,precision:10, scale: 1

      t.timestamps
    end
  end
end
