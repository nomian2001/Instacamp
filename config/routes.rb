Rails.application.routes.draw do
  # photos
  # GET  /photos          => photos#index
  # GET  /photos/new      => photos#new
  # POST /photos          => photos#create
  # GET  /photos/:id      => photos#show
  # GET  /photos/:id/edit => photos#edit
  # PATCH /photos/:id     => photos#update
  # DELETE /photos/:id    => photos#destroy
  resources :photos do
    # GET /photos/:photo_id/comments             => photos_comments#index
    # GET /photos/:photo_id/comments/new        => photos_comments#new
    # POST /photos/:photo_id/comments           => photos_comments#create
    # GET /photos/:photo_id/comments/:id        => photos_comments#show
    # GET /photos/:photo_id/comments/:id/edit   => photos_comments#edit
    # PATCH /photos/:photo_id/comments/:id      => photos_comments#update
    # DELETE /photos/:photo_id/comments/:id     => photos_comments#destroy
    resources :comments
  end
    
  get 'photos/new'
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
