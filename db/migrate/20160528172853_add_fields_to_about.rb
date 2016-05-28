class AddFieldsToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :title, :string
    add_column :abouts, :content, :text
  end
end
