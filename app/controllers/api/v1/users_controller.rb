
class Api::V1::UsersController < ApplicationController
	before_action :require_login, only: [:index, :update]
	
	def index
		users = User.order('created_at DESC');
		render json: users.reload, status: :ok
	end

	def create
		user = User.new(users_params)

		if user.save
			render json: user.reload, status: :ok
		else
			render json: user.errors, status: :bad_request
		end
	end

	def update
		user = User.find(params[:id])

		if user.update_attributes(users_params)
			render json: user.reload, status: :ok
		else
			render json: user.errors, status: :bad_request
		end
    end

	private

	def users_params
		params.permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :month, :day, :year, :gender, :blood_type, :address_street, :address_city, :address_province, :contact_info, :avatar, :user_type)
	end
end