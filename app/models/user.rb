require 'digest/sha1'

class User < ApplicationRecord
  
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
