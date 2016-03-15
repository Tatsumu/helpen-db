class SessionsController < ApplicationController
  def new
    user = Position.find_by_mail(params[:mail])
    if user && user.authenticate(params[:pin])
      session[:user] = user.id
    end
    redirect '/'
  end
end
