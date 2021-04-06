class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, length: { minimum: 8}

  def self.authenticate_with_credentials(email, password)
    trimmed_email = email.strip
    user = User.where('lower(email) = ?', trimmed_email.downcase).first
    # If the user exists AND the password entered is correct.
    return user if user && user.authenticate(password)
    return nil
  end

end
