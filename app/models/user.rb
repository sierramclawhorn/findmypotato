require 'bcrypt'

class User < ActiveRecord::Base

  has_many :comments
  has_many :pins

  include BCrypt

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end