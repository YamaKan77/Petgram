class CommentsController < ApplicationController
	before_action :set_pic

	def create
		@comment = @pic.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		else
			flash[:alert] = "Check comment form, wrong input"
			render root_path
		end
	end

	def destroy
		@comment = @pic.comments.find(params[:id])

		if @comment.user_id == current_user.id
			@comment.delete
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		end
	end


	private
	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_pic
		@pic = Pic.find(params[:pic_id])
	end
end
