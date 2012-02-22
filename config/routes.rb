Rails.application.routes.draw do
  
#BetaInvite::Engine.routes.draw do  
  # It's that simple.  Run rake routes from your 'main app' and you will see
  # the routes from the engine listed after any routes you define in the main
  # app.
	
	# Routes related to invite
    match '/'      => 'beta_invite/home#index', :as => 'invite_root'    
    match 'create_beta_invite'  => 'beta_invite/beta_invite#create'
  	resources :beta_invite
end