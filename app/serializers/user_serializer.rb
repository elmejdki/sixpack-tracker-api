class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :avatar_url, :role
end
