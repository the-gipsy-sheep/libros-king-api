Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, only: %i[index show create update destroy]
    end
  end
end
