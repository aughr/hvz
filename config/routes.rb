Hvz::Application.routes.draw do
  resources :games

  root :to => 'Clearance::Sessions#new'
end
