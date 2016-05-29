class CreateUserTariffs < ActiveRecord::Migration
  def change
    create_table :user_tariffs do |t|
      t.integer :user_id
      t.integer :tariff_id
      t.string :expired_date
      t.boolean :current
      t.boolean :end

      t.timestamps null: false
    end
  end
end
