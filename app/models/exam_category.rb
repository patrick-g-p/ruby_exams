class ExamCategory < ActiveRecord::Base
  belongs_to :exam
  belongs_to :category
end
