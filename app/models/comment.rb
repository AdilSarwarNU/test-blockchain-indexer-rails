class Comment < ApplicationRecord
  belongs_to :transactions, foreign_key: "transaction_id", class_name: "Transaction"
end
