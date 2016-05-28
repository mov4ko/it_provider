class AddPhotoToTestimonials < ActiveRecord::Migration
  def up
    add_attachment :testimonials, :photo
  end

  def down
    remove_attachment :testimonials, :photo
  end
end
