Rails.application.routes.draw do
  root '/', controller: :short_links, action: :new

  get '/:slug', controller: :short_links, action: :handleSlug
  post '/short_links/', controller: :short_links, action: :create
end
