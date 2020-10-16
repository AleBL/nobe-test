class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,   presence: true
  validates :email,  presence: true

  validates_uniqueness_of :email

  has_one :account, dependent: :destroy

  after_create :create_account

  private

  def create_account
    @ac = Account.new(user: self, balance: 0)
    unless @ac.save
      raise "Account could not be created"
    end
  end
end
