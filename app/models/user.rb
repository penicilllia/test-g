class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable
  
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true,
                    uniqueness: true

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
