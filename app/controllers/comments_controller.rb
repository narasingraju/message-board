class CommentsController < ApplicationController

    def new
      @comment = Comment.new
    end

    def create
      @post = Post.find(params[:post_id].to_i)
      @comment = @post.comments.create(comment_params)
      if @comment.save
        flash[:notice] = "Successfully created..."
      redirect_to post_path(@post)
      end
    end
    
    def comment_params
      params.require(:comment).permit(:comment)
    end

    

end
