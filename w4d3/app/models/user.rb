# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, :session_token, presence: true
  validates :password_digest, presence: true

  def validate_pd
    if self.password_digest.nil?
  end

  private
  def user_params
    params.require(:user).permit()
  end
end
