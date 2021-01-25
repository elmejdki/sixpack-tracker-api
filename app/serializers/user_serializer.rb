class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :email, :avatar, :role

  def avatar
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end
end
