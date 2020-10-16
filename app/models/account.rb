class Account < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true
  validates :number,  presence: true

  validates_numericality_of :balance, greater_than_or_equal_to: 0
end
