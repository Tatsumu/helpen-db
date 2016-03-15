class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :new
  def new
    user = User.find_by_mail(params[:mail])
    if user && user.authenticate(params[:pin])
      session[:user] = user.id
      redirect_to '/'
    end
    msg = "成功"
    puts msg
  end
  
  def signin
  end
end
