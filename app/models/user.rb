class User < ApplicationRecord
  #has_many :tests_users
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
end
