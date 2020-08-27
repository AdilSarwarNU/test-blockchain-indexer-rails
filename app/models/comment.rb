class Comment < ApplicationRecord
  belongs_to :transactions, foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :users, foreign_key: "user_id", class_name: "User"

  scope :desc_created_at, -> { order(created_at: :desc) }

end
