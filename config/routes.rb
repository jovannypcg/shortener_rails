Rails.application.routes.draw do
  root '/', controller: :short_links, action: :new

  get '/:slug', controller: :short_links, action: :handleSlug

  post '/short_links/', controller: :short_links, action: :create
  get '/short_links/:id', controller: :short_links, action: :show, as: 'short_link'
end
