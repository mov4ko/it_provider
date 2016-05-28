class PagesController < ApplicationController

	before_action :set_users_question, only: [:faq, :testimonials]
	before_action :authenticate_user!, only: [:dashboard]

	def home
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

	private
	def set_users_question
		@question = ClientsQuestion.new
	end

	def users_question_params
		params.require(:clients_question).permit(:name, :email, :subject, :message)
	end
end
