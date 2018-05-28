class SessionsController < ApplicationController
  before_action { flash.clear }
  def new
  end

  def create
  	if params[:session][:username] == 'admin' && params[:session][:password] == 'admin'
  		session[:user_id] = session[:username]
  		redirect_to admin_dashboard_path
  	else
  		flash[:danger] = "Username or password is invalid"
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  	flash[:success] = "Logged out succesfully!"
  end
end
