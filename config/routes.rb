Wikiflashcards::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :books do
    resources :chapters
  end
  
  resources :chapters do
    resources :cards
  end
  
  resources :cards

  get 'chapters/:id/quiz' => 'chapters#quiz', :as => :quiz_me
  get 'chapters/:id/history' => 'chapters#history', :as => :chapter_history
  
  match 'search' => 'home#search'
  resources :my_books
  
  root :to => 'home#index'
  
end
