class User < ActiveRecord::Base

  has_secure_password

  has_many :comments
  has_many :posts
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
