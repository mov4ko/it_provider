class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :title
      t.string :price
      t.string :speed
      t.string :service1
      t.string :service2

      t.timestamps null: false
    end
  end
end
