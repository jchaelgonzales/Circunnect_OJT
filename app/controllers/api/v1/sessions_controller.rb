class Api::V1::SessionsController < ApplicationController
  skip_before_action :require_login, only: [:login_user], raise: false

  def login_user
    if user = User.valid_login?(params[:username], params[:password])
      	user.password_confirmation = params[:password]
      	user.password = params[:password]
    		user.regenerate_auth_token
    		render json: { status: 'Success', data:user }, status: :ok
  	else
        render_unauthorized("Error with your login or password")
    end
  end

  def logout_user
  	p current_user
  	current_user.invalidate_token
  	head :ok
  end
end



# 	def current_user
#     	@current_user ||= authentication_auth_token
#   	end

# 	def create
# 		user = User.find_by_username(params[:username])

# 		if user && user.authenticate(params[:password])
# 			user.regenerate_auth_token
# 			# render json: token, status: :ok

# 			render json: { status: 'Success', data:user }, status: :ok
# 		else
# 			render json: { status: 'Wrong email or password' }, status: :unauthorized
# 		end
# 	end

# 	def destroy
#     	current_user = nil
#  	end
# end
