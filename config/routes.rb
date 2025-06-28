Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom error pages
  match "/:code", to: "errors#error_page", via: :all,
    constraints: { code: /(400|404|406|422|500)/ }

  # Test routes for error simulation (development only)
  if Rails.env.development?
    get "/force_404", to: "errors#error_page", defaults: { code: "404" }
  end
end
