class Question < ActiveRecord::Base
  belongs_to :exam
  has_one :answer

  validates :body, presence: true
end
