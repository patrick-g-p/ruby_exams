class Category < ActiveRecord::Base
  has_many :exam_categories
  has_many :exams, through: :exam_categories
end
