class Admin < User
  has_many :tests

  validates :first_name, presence: true
  validates :last_name, presence: true
  
end
