class FaqsController < ApplicationController
	load_and_authorize_resource except: [:index]

	def index
		@faqs = Faq.all.order("created_at DESC")
	end

	# def show
	# end

	# def new
	# 	@faq = Faq.new
	# end

	# def create
	# 	@faq = Faq.new(faq_params)
	# 	if @faq.save
	# 		redirect_to @faq
	# 	else
	# 		render 'new'
	# 	end
	# end

	# def edit
	# end

	# def update
	# 	if @faq.update(faq_params)
	# 		redirect_to @faq
	# 	else
	# 		render 'edit'
	# 	end
	# end

	# def destroy
	# 	@faq.destroy
	# 	redirect_to root_path
	# end

	# private

	# def find_faq
	# 	@faq = Faq.find(params[:id])
	# end

	# def faq_params
	# 	params.require(:faq).permit(:question, :answer)
	# end
end
