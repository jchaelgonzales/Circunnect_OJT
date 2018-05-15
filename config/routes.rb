Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :users
			resources :requests
			resources :bloodgroups
		end
	end

	post 'session', to: 'session#create', as:'login'
	delete 'session', to: 'session#destroy', as: 'logout'
	
end
