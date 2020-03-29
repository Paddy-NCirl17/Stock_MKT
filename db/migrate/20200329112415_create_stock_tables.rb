class CreateStockTables < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_tables do |t|
      t.string :ticker
      t.integer :user_id

      t.timestamps
    end
    add_index :stock_tables, :user_id
  end
end
