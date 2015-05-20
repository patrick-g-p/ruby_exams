class User < ActiveRecord::Base
  include Sluggable

  has_many :exams
  has_many :comments

  has_secure_password validations: false

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end

end
