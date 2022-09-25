module Mutations
  class UpdateUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :email, String, required: false

    def resolve(id:, name:, email: nil)
      user = user.find(id)
      if user.update(name: name, email: email)
        { user: user }
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end
  end
end
