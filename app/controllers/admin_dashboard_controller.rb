class AdminDashboardController < ApplicationController
	before_action :must_login
	before_action { flash.clear }
	
	def home
		@users = User.all
	end
end
