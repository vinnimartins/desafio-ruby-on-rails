class Stores < ApplicationRecord
  validates :owner, presence: true, length: { maximum: 15 }
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :balance, presence: true
end
