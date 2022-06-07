class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable
  
  has_many :user_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP } 

  def test_passage(test)
    self.test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.class == Admin
  end

end
