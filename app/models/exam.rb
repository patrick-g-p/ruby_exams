class Exam < ActiveRecord::Base
  has_many :questions
  has_many :exam_categories
  has_many :categories, through: :exam_categories
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

end
