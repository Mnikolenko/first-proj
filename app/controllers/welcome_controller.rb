class WelcomeController < ApplicationController
  def index
     user_agent=request.user_agent

    render 'index.html.haml', :locals => { :user_agent => request.user_agent }
  end
end
