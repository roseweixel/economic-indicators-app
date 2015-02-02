Rails.application.routes.draw do
  resources :categories do
    resources :line_items
  end

  get 'categories/:id/line_items/:year' => 'line_items#show', :as => 'line_item'
end
