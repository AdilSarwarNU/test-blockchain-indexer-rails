json.is_success true
json.error_code nil
json.message "Transactions found successfully"
json.result do
  json.total @total
  json.value @transactions do |transaction|
    json.merge! transaction.attributes
  end
end
