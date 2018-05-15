class Api::V1::UsersController < ApplicationController
	# skip_before_action :verify_authenticity_token

	def index
		users = User.order('created_at DESC');
		render json: {status: 'SUCCESS', message:'Loaded users', data:users}, status: :ok
	end

	def create
		user = User.new(users_params)

		if user.save
			render json: {status: 'SUCCESS', message:'Saved user', data:user}, status: :ok
		else
			render json: user.errors, status: :bad_request
		end
	end

	private

	def users_params
		params.permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender, :address_street, :address_city, :address_province, :contact_no)
	end
end