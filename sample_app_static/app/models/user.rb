class User < ActiveRecord::Base
  #attr_accessible :name, :email, :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token
  has_secure_password

  private
  def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
  end

end
