class User < ApplicationRecord
  has_many :lists
  validates_presence_of :email, :password
end
