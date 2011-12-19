class WelcomeController < ApplicationController
  def index


        if params[:user_email] && params[:pass] then
        user = User.find_by_user_email(params[:user_email])
        if user && user.pass == params[:pass]
       redirect_to '/loged'
      else

      end
    end
  end
  end

