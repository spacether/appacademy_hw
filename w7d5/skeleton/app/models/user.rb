# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :text             not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  attr_reader :password
  after_initialize :ensure_session_token

  def self.random
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= self.class.random
  end

  def reset_session_tokens
    self.session_token = self.class.random
    self.save
    self.session_token
  end

end
