module Mutations
  class DeleteUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      user = User.find(id)
      if user.destroy
        {
          user: user,
        }
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end
  end
end
