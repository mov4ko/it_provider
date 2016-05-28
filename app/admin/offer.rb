ActiveAdmin.register Offer do

permit_params :title, :content, :image

form do |f|
  f.inputs "Блог" do
    f.input :title
    f.input :content
    f.input :image, :required => false, :as => :file
  end
  f.actions
 end

show do |ad|
  attributes_table do
    row :title
    row :content
    row :image do
      image_tag(ad.image.url(:thumb))
    end
  end
 end


end
