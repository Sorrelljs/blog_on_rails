class CommentsController < ApplicationController
    def create
        @post = Post.find params[:post_id]
        @comment = Comment.new comment_params
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
          flash[:light] = "comment written"
          redirect_to post_path(@post)
        else 
          render "posts/show"
        end
      end

    
      def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        flash[:danger] = "comment deleted"
        redirect_to post_path(@comment.post)
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:body)
      end
end
