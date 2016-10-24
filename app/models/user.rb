class User < ApplicationRecord
  validates :name, :email, :password, presence: true

  validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = User.find_by(email: email, password: password)
    if !user.nil?
      return user
    else
      nil
    end
  end

end
