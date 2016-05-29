class PagesController < ApplicationController

	before_action :set_users_question, only: [:faq, :testimonials, :contact]
	before_action :authenticate_user!, only: [:dashboard, :buy_tariff]

	def home
		@tariffs = Tariff.all
		@testimonials = Testimonial.all.limit(3)
	end

	def faq
		@faq = Faq.all
	end

	def about_us
		@about = About.first
	end

	def blog
		@posts = Blog.all
	end

	def post
		@post = Blog.find(params[:id])
	end

	def tariffs
		@tariffs = Tariff.all
	end

	def testimonials
		@testimonials = Testimonial.all
	end

	def offers
		@offers = Offer.all
	end

	def contact
	end

	def dashboard
	end

	def clients_questions
		@question = ClientsQuestion.new(users_question_params)

		if @question.save
			redirect_to :back, flash: { notice: "Дякуємо за ваше запитання." }
		else
			redirect_to :back, flash: { alert: "Сталася помилка при збереженні вашого запитання, спробуйде знову." }
		end
	end

	def buy_tariff
		@tariff = Tariff.find(params[:id])

		if current_user.tariffs.size < 2
			current_user.account.money = current_user.account.money.to_i - @tariff.price.to_i
			if current_user.account.money.to_i > 0
				current_user.account.save
				@user_tariff = UserTariff.new
				@user_tariff.expired = current_user.tariffs.size > 0 ? Date.today + 2.month : Date.today + 1.month
				@user_tariff.user = current_user
				@user_tariff.tariff = Tariff.find(params[:id])
				if @user_tariff.save

					redirect_to :back, flash: { notice: "Дякуємо за покупку, тариф буде активовано з наступного місяця." }
				else
					redirect_to :back, flash: { alert: "Сталася помилка при покупці, спробуйде знову." }
				end
			else
				redirect_to :back, flash: { alert: "Не достатньо коштів на рахунку." }
			end
		else
			redirect_to :back, flash: { alert: "Перевищено максимальну кількість тарифів на аккаунт." }
		end

	end

	private
	def set_users_question
		@question = ClientsQuestion.new
	end

	def users_question_params
		params.require(:clients_question).permit(:name, :email, :subject, :message)
	end
end
