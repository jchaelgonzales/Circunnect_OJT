Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :users
			resources :requests
			resources :bloodgroups

			# post 'sessions', to: 'sessions#create', as:'login'
			# delete 'sessions', to: 'sessions#destroy', as: 'logout'
    			post   "/login"       => "sessions#login_user"
    			delete "/logout"      => "sessions#logout_user"
		end
	end	
end
