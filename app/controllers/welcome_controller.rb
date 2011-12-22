class WelcomeController < ApplicationController
  def index
       redirect_to loged_path if session[:user_id]

        if params[:user_email] && params[:pass] then
        user = User.find_by_user_email(params[:user_email])
        if user && user.pass == params[:pass]
          session[:user_id]=user.id
        redirect_to loged_path

      else

      end
    end
  end

  def loged
    if !session[:user_id]
      redirect_to root_path
    else
      @current_user = User.find(session[:user_id]).user_email
      @users = User.all
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def reg
      if params[:user_email] && params[:pass] && !params[:user_email].empty? && !params[:pass].empty? then
        user_email_exists = User.find_by_user_email(params[:user_email])
        if !user_email_exists
          @user = User.new(:user_email => params[:user_email],:pass => params[:pass])
          @user.save
          redirect_to root_path
        else
          flash[:notice] = "User with such e-mail is already exist"
        end

      end
  end

  end

