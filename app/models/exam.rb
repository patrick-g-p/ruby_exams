class Exam < ActiveRecord::Base
  include Sluggable
  include Voteable

  has_many :exam_categories
  has_many :categories, through: :exam_categories
  has_many :questions
  has_many :comments
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  sluggable_column :name

  validates :name, presence: true
  validates :doc_url, presence: true

end
