class PostsController < ApplicationController

  def newpost

    if !session[:user_id]

      redirect_to root_path

    else

       if params[:title] && params[:text] && !params[:title].empty? && !params[:text].empty? then

          @post = Post.new(:title => params[:title],:text => params[:text],:user_id => session[:user_id])

          @post.save
          redirect_to loged_path
       end

    end
  end

    def index

    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @user = User.find(session[:user_id])
      @users = User.all
      @users.delete(@user)
      @posts = Post.all.sort_by{:updated_at}.reverse

    end
    end

  def answer
      if !session[:user_id]
      redirect_to root_path
    else

    end
  end


end
