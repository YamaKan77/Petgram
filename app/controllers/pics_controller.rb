class PicsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@pics = Pic.all
	end

	def new
		@pic = Pic.new
	end

	def create
		if @pic = Pic.create(pic_params)
			flash[:success] = "Your post has been created!"
			redirect_to pics_path
		else
			 flash.now[:alert] = "Your new post couldn't be created!  Please
check the form."
			render :new
		end
	end

	def show
	end

	def edit 
		
	end

	def update
		if @pic.update(pic_params)
			flash[:success] = "Post updated!"
			redirect_to pic_path(@pic)
		else
			flash.now[:alert] = "Update failed. Please
check the form."
			render :edit
		end
	end

	def destroy
		
		@pic.destroy
		redirect_to pics_path
	end

	private
	def pic_params
		params.require(:pic).permit(:image, :caption)
	end

	def set_post
		@pic = Pic.find(params[:id])
	end

end
