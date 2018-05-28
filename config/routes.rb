Rails.application.routes.draw do
  #admin_login
  #root 'sessions#new'
  	#get 'login', to: 'sessions#new'
  	#post 'login', to: 'sessions#create'
  	#delete 'logout', to: 'sessions#destroy'
  #admin_session
  	#get 'admin/dashboard'

  #admin_sessions_login
  	get 'login', to: 'admin_sessions#new'
  	post 'login', to: 'admin_sessions#create'
  	delete 'logout', to: 'admin_sessions#destroy'
	#admin_dashboard
		root 'admin_dashboard#home'
		get 'admin/dashboard', to: 'admin_dashboard#home'

  #api
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
