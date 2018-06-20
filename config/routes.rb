Rails.application.routes.draw do
  #admin_login
  #root 'sessions#new'
  	#get 'login', to: 'sessions#new'
  	#post 'login', to: 'sessions#create'
  	#delete 'logout', to: 'sessions#destroy'
  #admin_session
  	#get 'admin/dashboard'

  #admin_sessions
  	get 'login', to: 'admin_sessions#new'
  	post 'login', to: 'admin_sessions#create'
  	delete 'logout', to: 'admin_sessions#destroy'
	#admin_dashboard
		root 'admin_dashboard#home'
		get 'admin/dashboard', to: 'admin_dashboard#home'
  #admin_remove_user
    delete 'admin/dashboard/user/:id', to: 'admin_dashboard#remove_user', as: 'remove_user'
  #admin_add_user
    post 'admin/dashboard/user', to: 'admin_dashboard#create', as: 'create_user'
  #admin_change_user_status
    post 'admin/dashboard/user/:id', to: 'admin_dashboard#change_user_status', as: 'change_user_status'
  #admin_edit_user
    post 'admin/dashboard/user/edit/:id', to: 'admin_dashboard#edit', as: 'edit_user'

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
