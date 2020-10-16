class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,   presence: true
  validates :email,  presence: true

  validates_uniqueness_of :email

  has_one :account, dependent: :destroy
end
