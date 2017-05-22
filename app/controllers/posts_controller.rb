class PostsController < ApplicationController
    def new
        @post = Post.new
        @comment = Comment.new(post_id: params[:post_id])    
    end

    def create
       @user = current_user
       @post = current_user.posts.create(post_params)
          if @post.save
            flash[:success] = "post was successfully created."
            redirect_to posts_path
          else
            redirect_to new_post_path
          end
    end
    
    def index
        @search = Post.search(params[:q])
        @posts = @search.result.paginate(page: params[:page], :per_page => 5).order("created_at DESC")
    end

    def show
        @post = Post.find(params[:id])
        @likes = @post.likes.count
        @liked_or_not =  Like.where(:user_id => current_user.id, :post_id => @post.id).present?
    end

    def edit
       @post = Post.find(params[:id])
        
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          flash[:success] = "post was successfully updated."
         redirect_to posts_path, success: 'post was successfully updated.' 
       end
    end

    def destroy
       @post = Post.find(params[:id])
       @post.destroy
       redirect_to posts_url, notice: 'Post was successfully destroyed.' 
    end

    def post_params
        params.require(:post).permit(:desc, :title, :user_id, :comments => [:comment], :likes => [:like])
    end

    def likepost
      puts "like me!"
      puts params[:post_id]
      @post = Post.find(params[:post_id])
      like = Like.create(:post_id => params[:post_id], :user_id => current_user.id)
       redirect_to post_path(@post)
    end

    def likecomment
      @post = Post.find(params[:post_id])
      CommentLike.create(:comment_id => params[:comment_id], :user_id => current_user.id, :post_id => params[:post_id])
      redirect_to post_path(@post)
    end
end
