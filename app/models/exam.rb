class Exam < ActiveRecord::Base
  has_many :exam_categories
  has_many :categories, through: :exam_categories
end
