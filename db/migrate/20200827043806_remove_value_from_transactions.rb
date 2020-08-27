class RemoveValueFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :value, :integer
  end
end
