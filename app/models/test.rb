class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  
  has_many :tests_users
  has_many :users, through: :tests_users

  #validates :title, presence: true,
  #                  uniqueness: true

  #validates :level, numericality: { only_integer: true }

  #with_options if: :is_test? do |test|
  #  test.validates :title, presence: true
  #  test.validates :title, uniqueness: true
  #  test.validates :level, numericality: { only_integer: true }
  #end

  #validates :validate_positive_level


  MAXLEVEL = Float::INFINITY

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, ->  { where(level: 5..MAXLEVEL) }

  scope :category_list, -> (category_name) { joins(:category).where('categories.title like ?', category_name).order(title: :desc).pluck(:title) }

  private

  def validate_positive_level
    errors.add(:level) if level.to_i <= 0
  end

  #def self.category_list(category_name)
  #  joins(:category).where('categories.title like ?', category_name).order(title: :desc).pluck(:title)
  #end
end
