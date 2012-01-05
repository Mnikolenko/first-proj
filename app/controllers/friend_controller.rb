class FriendController < ApplicationController
   def index
    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @friend_user = params[:email]
      @user = User.find(session[:user_id])
      session[:friend_id] = User.find_by_user_email(@friend_user).id
     friend_exists = @user.friends.find_by_friend_id(session[:friend_id])
     @add_delete = "Add to"
     @add_delete = "Delete from" if friend_exists

     end
   end

    def newfriend
    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @friend_user = params[:email]
      @user = User.find(session[:user_id])
      session[:friend_id] = User.find_by_user_email(@friend_user).id
     friend_exists = @user.friends.find_by_friend_id(session[:friend_id])

     redirect_to deletefriends_path if friend_exists

     end
   end

   def deletefriends
    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @friend_user = params[:email]
      @user = User.find(session[:user_id])
      session[:friend_id] = User.find_by_user_email(@friend_user).id
     friend_exists = @user.friends.find_by_friend_id(session[:friend_id])

     redirect_to friend_path if !friend_exists

     end
   end

  def addfriend

    if !session[:user_id]

      redirect_to root_path

    else


          @nfriend = Friend.new(:user_id => session[:user_id],:friend_id => session[:friend_id])

          @nfriend.save
          redirect_to loged_path
       end

    end

      def delfriend

    if !session[:user_id]

      redirect_to root_path

    else
          Friend.delete_all(:user_id => session[:user_id],:friend_id => session[:friend_id])
          redirect_to loged_path
       end

      end

   def friends_posts

    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @user = User.find(session[:user_id])
      @friend_user = params[:email]
      session[:friend_id] = User.find_by_user_email(@friend_user).id
      @posts = Post.find_all_by_user_id(session[:friend_id]).sort_by{:updated_at}.reverse

    end
    end
end
