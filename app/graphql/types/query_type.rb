module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # ドキュメントでは[Types::UserType]とあるが省略できそう
    # 複数形の[UserType]
    field :users, [UserType], null: false
    # 単数系UserType
    field :user, UserType, "Find a user by ID" do
      argument :id, ID
    end
    # They will be entry points for queries on your schema.
    def users
      User.all
    end

    # キーワード引数 呼び出す側はuser(id: 1)みたいな呼び方
    def user(id:)
      User.find(id)
    end
  end
end
