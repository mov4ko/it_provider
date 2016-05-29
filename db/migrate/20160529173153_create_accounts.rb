class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :money, default: '10000'

      t.timestamps null: false
    end
  end
end
