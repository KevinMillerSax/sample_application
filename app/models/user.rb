class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /[\w+.\-]+@[a-z\-.]+\.[a-z]+/
  validates :email, presence: true, length: { maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: {minimum: 6}

  # return a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user in the database 
  def remember
    self.remember_token = User.new_token
  end
end
