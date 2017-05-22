class LikesController < ApplicationController
    def new
      @like = Like.new
    end

    def create
      @comment = Comment.find(params[:comment_id].to_i)
      @like = @comment.likes.create(like_params)
      if @like.save
        flash[:notice] = "Successfully created..."
      redirect_to comment_path(@post)
      end
    end
    
    def comment_params
      params.require(:like).permit(:comment_id, :post_id)
    end
end
