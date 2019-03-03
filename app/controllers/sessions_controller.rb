class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name,password)
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private
  
  def login(name,password)
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      return true
    else
      return false
    end
  end
end
