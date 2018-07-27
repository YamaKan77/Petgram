class CommentsController < ApplicationController
	before_action :set_pic
	def create
		@comment = @pic.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "Comment succeeded"
			redirect_to root_path
		else
			flash[:alert] = "Check comment form, wrong input"
			render root_path
		end
	end

	def destroy
		@comment = @pic.comments.find(params[:id])

		@comment.destroy
		flash[:success] = "Comment deleted"
		redirect_to root_path
	end


	private
	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_pic
		@pic = Pic.find(params[:pic_id])
	end
end
