class AdminSessionsController < ApplicationController
	before_action :check_session, only: [:new]

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.find_by(username: params[:admin][:username])
		if @admin && @admin.authenticate(params[:admin][:password])
			session[:user_id] = @admin.id
			redirect_to admin_dashboard_path
		else
  		flash[:danger] = "Username or password is invalid"
  		redirect_to login_path
  	end
  end

  def destroy
  	@current_admin = session[:user_id] = nil
  	redirect_to login_path
  	flash[:success] = "Logged out successfully!"
  end

  private
	  def check_session
		  redirect_to root_path unless current_admin.blank?
		end
end
