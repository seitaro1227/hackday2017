Rails.application.routes.draw do
  if Rails.env.development?
    get '/login_as/:user_id', to: 'development/sessions#login_as'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  scope '/api/v1' do
    resource :amason_kozuchi, controller: :amason_kozuchi
  end

  root 'home#index'
end
