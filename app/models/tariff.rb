class Tariff < ActiveRecord::Base

	has_many :user_tariffs

  	has_many :users, through: :user_tariffs
end
