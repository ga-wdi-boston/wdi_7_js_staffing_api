Rails.application.routes.draw do
  resources :staffing_requests, except: [:new, :edit]
  resources :allocations, except: [:new, :edit]
  resources :projects, except: [:new, :edit]
  resources :skills, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  resources :titles, except: [:new, :edit]
end
