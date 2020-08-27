class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :block_number
      t.string :time_stamp
      t.string :hash
      t.integer :nonce
      t.string :blockHash
      t.integer :transaction_index
      t.bigint :from
      t.bigint :to
      t.integer :value
      t.string :gas
      t.string :gas_price
      t.string :is_error
      t.string :txreceipt_status
      t.string :input
      t.string :contract_address
      t.string :cumulative_gas_used
      t.string :gas_used
      t.string :confirmations

      t.timestamps
    end
  end
end
