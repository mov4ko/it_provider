class UserTariff < ActiveRecord::Base
	belongs_to :user
	belongs_to :tariff
end
