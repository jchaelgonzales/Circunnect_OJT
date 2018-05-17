class Api::V1::SessionsController < ApplicationController
	def current_user
    	@current_user ||= authentication_auth_token
  	end

	def create
		user = User.find_by_username(params[:username])

		if user && user.authenticate(params[:password])
			user.regenerate_auth_token
			# render json: token, status: :ok

			render json: { status: 'Success', data:user }, status: :ok
		else
			render json: { status: 'Wrong email or password' }, status: :unauthorized
		end
	end

	def destroy
    	current_user = nil
 	end
end
