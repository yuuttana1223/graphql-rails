module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # ドキュメントでは[Types::UserType]とあるが省略できそう
    field :users, [UserType], null: false
    # They will be entry points for queries on your schema.
    def users
      User.all
    end
  end
end
