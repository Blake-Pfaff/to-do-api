class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  validates_presence_of :email, :password
end
