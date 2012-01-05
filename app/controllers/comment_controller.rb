class CommentController < ApplicationController
   def index
    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @user = User.find(session[:user_id])
      @users = User.all
      @users.delete(@user)
      @post = Post.find(params[:id])
      session[:post_id] = params[:id]
    end
   end

    def newcom
    if !session[:user_id]
      redirect_to root_path
    else
      if params[:text] && !params[:text].empty? then
          @comment = Comment.new(:text => params[:text],:post_id=> session[:post_id])
          @comment.save
          redirect_to comments_path(session[:post_id])
       end

    end
  end

end
