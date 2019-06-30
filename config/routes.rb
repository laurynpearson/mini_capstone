Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/products" => "products#all_available_products"
    # get "/all_products" => "products#all_products"
    # url_query
    # get "/product" => "products#find_by"
    # url segment
    # get "/product/:name" => 'products#find_by'
  #   get "/photos" => "photos#index"
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 
    'products#create'
    patch '/products/:id' => 'products#update'
  end
end
