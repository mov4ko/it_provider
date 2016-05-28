class AddImageToAbout < ActiveRecord::Migration
  def up
    add_attachment :abouts, :image
  end

  def down
    remove_attachment :abouts, :image
  end
end
