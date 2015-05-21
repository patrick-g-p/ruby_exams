class Category < ActiveRecord::Base
  include Sluggable

  has_many :exam_categories
  has_many :exams, through: :exam_categories

  sluggable_column :name

  validates :name, presence: true
end
