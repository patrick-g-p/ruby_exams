class User < ActiveRecord::Base
  include Sluggable

  has_many :exams
  has_many :comments

  has_secure_password validations: false
  validates :username, presence: true
  validates_uniqueness_of :username
  validates :password, presence: true
  validates_length_of :password, minimum: 5

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end

end
