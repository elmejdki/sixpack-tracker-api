class User < ApplicationRecord
  after_initialize :init

  has_secure_password

  has_one_attached :avatar

  has_many :measurements, dependent: :destroy

  validates_presence_of :username, :email, :password_digest, :role
  validates_uniqueness_of :username, :email

  def init
    users = User.all

    if users.empty?
      self.role = 'super-admin'
    end

    self.role ||= 'user'
    self.avatar_url ||= ''
  end
end
