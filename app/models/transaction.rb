class Transaction < ApplicationRecord
  has_many :comments
  scope :desc_created_at, -> { order(created_at: :desc) }

  def self.query_parameters(q)
    query = self
    query = where(['transactions.from LIKE ? OR transactions.to LIKE ?', "%#{q}%", "%#{q}%"]) unless q.blank?
    query
  end

end
