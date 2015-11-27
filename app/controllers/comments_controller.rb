class CommentsController < ApplicationController
	
	def create
		@pin = Pin.find(params[:pin_id])
		@comment = @pin.comments.new(comment_params)
		if @comment.save
			redirect_to :back
		end
	end

	def destroy
		@pin = Pin.find(params[:pin_id])
		@comment = @pin.comments.find(params[:id])
		@comment.destroy
		redirect_to @pin
	end

	private
	def comment_params
		params.require(:comment).permit(:user_name, :body)
	end

end
