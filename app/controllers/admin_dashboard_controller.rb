class AdminDashboardController < ApplicationController
  before_action :must_login
	before_action { flash.clear }
	
	def home
		@users = User.all
	end

	def remove_user
		@user = User.find(params[:id])

		if @user.destroy
			flash[:success] = "User removed succesfully!"
		end
		redirect_to admin_dashboard_path
	end
end
