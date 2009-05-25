ActionController::Routing::Routes.draw do |map|
  map.resources :friends

  map.root :controller => 'home', :action => 'index'

  map.resources :messages
  map.inbox '/inbox', :controller => 'messages', :action => 'index'
  map.inbox_new '/inbox/new/:id', :controller => 'messages', :action => 'new'

  map.resources :admin, :only => [:index, :update]
  map.resources :backup, :only => [:index, :new, :show, :destroy, :create, :restore]
  map.resource  :config, :controller => "config"
  map.resource  :about, :controller => "about"
  map.resource  :help, :controller => "help"
  map.resource  :opt, :controller => "opt"



  # Default routes - facebook or not
  #map.facebook_root '', :controller => "match", :conditions => {:canvas => true}
  #map.root :controller => "authentication", :conditions => {:canvas => false}

  #map.auth       'authentication/:action',  :controller => 'authentication'
  #map.login      'authentication/login',    :controller => 'authentication', :action => 'login'
  #map.logout     'authentication/logout',   :controller => 'authentication', :action => 'logout'
  #map.register   'authentication/register', :controller => 'authentication', :action => 'register'

  #allow moving from CURL - Although GET generally not acceptable, post won't work without the forgery protection
  map.create_move 'match/:match_id/moves/:notation', :controller => 'move', :action => 'create', :defaults => { :notation => nil }

  map.resources :match , :except => [:delete], :shallow => true, :collection => { :create => :post } do |match|
    match.resources :moves, :controller => :move, :collection => { :create => :post }
    match.resource :chat
  end

  #sets controller courtesy of Sean
  map.resource :set, :member => {:change => :post}
  # map.resources :boards

  map.resource :user_session
  map.logout   '/logout',   :controller => 'user_sessions', :action => 'destroy'
  map.login    '/login',    :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup   '/signup',   :controller => 'users', :action => 'new'
  map.resource :account, :controller => "users"
  map.resources :accounts
  map.resources :users
end
