class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

    def new
      @post = Post.new
      end

      def show 
        @comment = Comment.new 
        @comments = @post.comments.order(created_at: :desc)
      end

     def index 
        @posts = Post.all.order(created_at: :desc)
    
     end

      def create
        post_params = params.require(:post).permit(:title, :body)
        @post = Post.new post_params
        if @post.save
          redirect_to posts_path
        else
          render :new
        end
      end

      def edit
      end
    
      def update
        if @post.update post_params
          flash[:dark] = "#{@post.title} updated"
          redirect_to post_path(@post)
        else
          render :edit 
        end
      end
      
      def destroy
        @post.destroy
        flash[:danger] = "#{@post.title} deleted"
        redirect_to posts_path
      end
      
      private

      def post_params
        # Use "require" on the params object to retrieve the nested 
        # hash of a key corresponding to the form data. We can also 
        # use "permit" to specify all input names that are allowable
        # because sometimes we don't need all the values from a form. 
        params.require(:post).permit(:title, :body)
      end

      def find_post
        @post = Post.find params[:id]
      end
end
