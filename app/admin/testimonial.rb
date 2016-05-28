ActiveAdmin.register Testimonial do

  permit_params :name, :message, :photo

  form do |f|
    f.inputs "Відгуки" do
      f.input :name
      f.input :message
      f.input :photo, :required => false, :as => :file
    end
    f.actions
   end

  show do |ad|
    attributes_table do
      row :name
      row :message
      row :photo do
        image_tag(ad.photo.url(:thumb))
      end
    end
   end
end
