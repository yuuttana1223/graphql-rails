Rails.application.routes.draw do
  if Rails.env.development?
    # https://github.com/rmosolgo/graphiql-rails
    # at: は GraphiQL が提供されるパスです。アプリからそのパスにアクセスすることで、GraphiQLにアクセスすることができます
    # graphql_path: GraphQLエンドポイントへのパスです。GraphiQLはこのパスにクエリーを送信します。
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
