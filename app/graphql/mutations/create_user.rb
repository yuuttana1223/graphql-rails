module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: false
    argument :name, String, required: true
    argument :email, String, required: false

    # nilを指定しないとエラーになる
    def resolve(name:, email: nil)
      user = User.create!(name: name, email: email)
      # 成功したときに変える値で、クライアント側からほしいargumentを指定する
      { user: user }
    end
  end
end
