class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :name
      t.decimal :height,precision:10, scale: 1
      t.decimal :weight,precision:10, scale: 1
      t.decimal :bmi,precision:10, scale: 1
      t.decimal :fat,precision:10, scale: 1
      t.decimal :moisture,precision:10, scale: 1
      t.decimal :muscle,precision:10, scale: 1
      t.decimal :bone,precision:10, scale: 1
      t.decimal :metabolism,precision:10, scale: 1
      t.decimal :visceral_fat,precision:10, scale: 1

      t.timestamps
    end
  end
end
