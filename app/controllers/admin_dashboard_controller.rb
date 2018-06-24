class AdminDashboardController < ApplicationController
  before_action :must_login
	before_action { flash.clear }
	before_action :find_user, only: [:edit, :change_user_status, :remove_user]
	
	def home
		@users = User.paginate(page: params[:page], per_page: 10)
		@user = User.new
		gon.usernames = User.pluck(:username)
	end

	def edit
		if params[:password].present?
			@user.update(month: @month, day: @day, year: @year,
												user_status: params[:user_status], user_type: params[:usertype],
												blood_type: params[:bloodtype], first_name: params[:firstname],
												last_name: params[:lastname], username: params[:username],
												email: params[:email], password: params[:password],
												address_street: params[:street], address_city: params[:city],
												address_province: params[:province], contact_info: params[:contactno],
												gender: params[:gender])
		else
			@user.update(month: @month, day: @day, year: @year,
												user_status: params[:user_status], user_type: params[:usertype],
												blood_type: params[:bloodtype], first_name: params[:firstname],
												last_name: params[:lastname], username: params[:username],
												email: params[:email], address_street: params[:street],
												address_city: params[:city], address_province: params[:province],
												contact_info: params[:contactno], gender: params[:gender])
		end
	end

	def create
		@month = Date.parse(params[:birthday]).strftime('%B')
		@day = Date.parse(params[:birthday]).strftime('%d')
		@year = Date.parse(params[:birthday]).strftime('%Y')
		@user = User.new(month: @month, day: @day, year: @year,
											user_status: 'Active', user_type: params[:usertype],
											blood_type: params[:bloodtype], first_name: params[:firstname],
											last_name: params[:lastname], username: params[:username],
											email: params[:email], password: params[:password],
											address_street: params[:street], address_city: params[:city],
											address_province: params[:province], contact_info: params[:contactno],
											gender: params[:gender])
		if User.exists?(username: params[:username])
			@user = User.new
		else
			if @user.save
				redirect_to admin_dashboard_path
			end
		end
	end

	def change_user_status
		if @user.user_status == 'Active'
			@user.update(user_status: 'Inactive')
		else
			@user.update(user_status: 'Active')
		end
		redirect_to admin_dashboard_path
	end

	def remove_user
		@user.destroy
		redirect_to admin_dashboard_path
	end

	def find_user
		@user = User.find(params[:id])
	end
end
