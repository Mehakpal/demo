class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates :password,  :presence => true
  validates :username, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true
end
