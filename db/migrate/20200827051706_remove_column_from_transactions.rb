class RemoveColumnFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :to, :bigint
    remove_column :transactions, :from, :bigint
  end
end
