Wikiflashcards::Application.routes.draw do

  match 'search' => 'home#search'
  
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :books do
    resources :chapters
  end
  
  resources :chapters do
    resources :cards
  end
  
  resources :cards
  resources :my_books

  get 'chapters/:id/quiz' => 'chapters#quiz', :as => :quiz_me
  get 'chapters/:id/history' => 'chapters#history', :as => :chapter_history
  get 'about' => 'home#about'
  
  root :to => 'home#index'
  
end
