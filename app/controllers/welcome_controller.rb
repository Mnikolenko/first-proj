class WelcomeController < ApplicationController
  def index
     render 'index.html.haml', :locals => { :user_agent => request.user_agent }
  end
end
