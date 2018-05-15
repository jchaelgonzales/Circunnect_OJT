class SessionController < ApplicationController

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
end
