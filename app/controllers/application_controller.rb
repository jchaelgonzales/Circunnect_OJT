class ApplicationController < ActionController::Base
  protect_from_forgery

	def require_login
    	authenticate_token || render_unauthorized("Access denied")
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
  	errors = { errors: [ { detail: message } ] }
  	render json: errors, status: :unauthorized
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      if user = User.find_by(auth_token: token)
    	 ActiveSupport::SecurityUtils.secure_compare(
            ::Digest::SHA256.hexdigest(token),
            ::Digest::SHA256.hexdigest(user.auth_token))
    	 user
      end
    end
  end  

	helper_method :current_admin, :logged_in?

	def current_admin
		@current_admin ||= Admin.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_admin
	end

	def must_login
		if !logged_in?
			flash[:danger] = "Please login!"
			redirect_to login_path
		end
	end
end