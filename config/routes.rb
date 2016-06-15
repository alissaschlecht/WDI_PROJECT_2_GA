Rails.application.routes.draw do
  root 'statics#home'

  get 'playlist/subscribe/:id', to: "playlists#subscribe", as: "subscribe_playlist"
  get 'playlist/unsubscribe/:id', to: "playlists#unsubscribe", as: "unsubscribe_playlist"
  get 'playlist/remove/:id', to: "playlists#remove", as: "remove_playlist"
  get 'playlists/show_all', to: "statics#show_all", as: "playlists_show_all"

  resources :videos
  resources :playlists
  devise_for :users


  get 'users/:id' => "users#show", as: "users_show"

  get 'playlist/:playlist_id/videos/new' => "videos#new", as: "videos_new"
  get 'playlists/:playlist_id/video/:id/edit' => "videos#edit", as: "videos_edit"
  get 'playlist/:playlist_id/videos/show' => "videos#show", as: "videos_show"



end
