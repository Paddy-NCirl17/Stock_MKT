json.extract! stock_table, :id, :ticker, :user_id, :created_at, :updated_at
json.url stock_table_url(stock_table, format: :json)
