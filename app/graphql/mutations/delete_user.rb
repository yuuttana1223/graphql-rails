module Mutations
  class DeleteUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      user = User.find(id).destroy!
      {
        user: user,
      }
    end
  end
end
