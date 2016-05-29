class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :content
      t.string :addr_country
      t.string :addr_city
      t.string :addr_street
      t.string :email_general
      t.string :email_office
      t.string :phone_mobile
      t.string :phone_office

      t.timestamps null: false
    end
  end
end
