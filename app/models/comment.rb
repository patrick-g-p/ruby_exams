class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :exam
end
