class User < ApplicationRecord
  has_many :tests_users
  has_many :tets, through: :tests_users

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true

end
