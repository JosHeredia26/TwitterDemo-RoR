class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  # Validations
  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :name, presence: true
end
