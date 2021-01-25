class User < ApplicationRecord
  after_initialize :init

  has_secure_password

  has_one_attached :avatar, dependent: :destroy

  has_many :measurements, dependent: :destroy

  validates_presence_of :username, :email, :password_digest, :role
  validates_uniqueness_of :username, :email

  def init
    users = User.all

    self.role = 'admin' if users.empty?

    self.role ||= false
  end
end
