class CreateClientsQuestions < ActiveRecord::Migration
  def change
    create_table :clients_questions do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
