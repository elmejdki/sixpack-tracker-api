class User < ApplicationRecord
  has_one_attached :avatar

  has_many :measurements, dependent: :destroy

  validates_presence_of :username, :email, :password_digest, :role
  validates_uniqueness_of :username, :email
end
