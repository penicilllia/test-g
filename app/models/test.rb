class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  
  has_many :tests_users
  has_many :users, through: :tests_users

  validate :title, presence: true

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  validate :validate_title_and_level

  MAXLEVEL = Float::INFINITY

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, ->  { where(level: 5..MAXLEVEL) }

  scope :category_list, -> (category_name) { joins(:category).where('categories.title like ?', category_name).order(title: :desc) }
  
  private

  def validate_title_and_level
    level_count = Test.where(title: title, level: level).count
    errors.add(:level) if level_count > 0
  end
end
