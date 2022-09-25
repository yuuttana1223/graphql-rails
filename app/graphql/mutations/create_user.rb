module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :name, String, required: true
    argument :email, String, required: false

    # nilを指定しないとエラーになる
    def resolve(name:, email: nil)
      user = User.new(name: name, email: email)
      if user.save
        # 成功したときに変える値で、クライアント側からほしいargumentを指定する
        { user: user }
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end
  end
end
