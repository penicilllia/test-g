class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  MAXLEVEL = Float::INFINITY

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, ->  { where(level: 5..MAXLEVEL) }
  
  scope :category_list, -> (category) { joins(:category).where("categories.title like ? ", category) }

  def self.categories_desc_title(category)
    category_list(category).order(:title, :desc).pluck(:title)
  end

end
