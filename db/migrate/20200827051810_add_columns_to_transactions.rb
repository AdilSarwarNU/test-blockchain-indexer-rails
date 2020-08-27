class AddColumnsToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :to, :string
    add_column :transactions, :from, :string
  end
end
