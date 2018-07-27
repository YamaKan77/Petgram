class PicsController < ApplicationController
	before_action :set_pic, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_action :owned_pic, only: [:edit, :update, :destroy]

	def index
		@pics = Pic.all
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)
		if @pic.save
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

	def set_pic
		@pic = Pic.find(params[:id])
	end

	def owned_pic
		unless current_user == @pic.user
			flash[:alert] = "That pic doesn't belong to you"
			redirect_to root_path
		end
	end

end
