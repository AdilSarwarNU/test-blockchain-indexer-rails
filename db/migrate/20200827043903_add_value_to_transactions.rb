class AddValueToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :value, :string
  end
end
