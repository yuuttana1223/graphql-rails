module Mutations
  class UpdateUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :email, String, required: false

    def resolve(id:, name:, email: nil)
      user = User.update!(id, name: name, email: email)
      { user: user }
    end
  end
end
