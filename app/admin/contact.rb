ActiveAdmin.register Contact do

permit_params :content, :addr_country, :addr_city, :addr_street, :email_general, :email_office, :phone_mobile, :phone_office


end
