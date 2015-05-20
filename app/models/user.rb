class User < ActiveRecord::Base
  has_many :exams
  has_many :comments

  has_secure_password validations: false

end
