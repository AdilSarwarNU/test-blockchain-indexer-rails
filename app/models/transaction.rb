class Transaction < ApplicationRecord
  validates_uniqueness_of :from, :to
  has_many :comments
end
