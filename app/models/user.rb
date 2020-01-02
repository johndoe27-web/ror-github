class User < ApplicationRecord
  has_many :microposts

  # Filter method to transform email to small cases before saving to db
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  # REGEX = Regular expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
end
