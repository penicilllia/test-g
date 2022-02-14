class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.category_list(category_name)
    joins(:category).where('categories.title like ?', category_name).order(title: :desc).pluck(:title)
  end
end
