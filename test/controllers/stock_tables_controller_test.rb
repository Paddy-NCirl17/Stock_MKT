require 'test_helper'

class StockTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_table = stock_tables(:one)
  end

  test "should get index" do
    get stock_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_table_url
    assert_response :success
  end

  test "should create stock_table" do
    assert_difference('StockTable.count') do
      post stock_tables_url, params: { stock_table: { ticker: @stock_table.ticker, user_id: @stock_table.user_id } }
    end

    assert_redirected_to stock_table_url(StockTable.last)
  end

  test "should show stock_table" do
    get stock_table_url(@stock_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_table_url(@stock_table)
    assert_response :success
  end

  test "should update stock_table" do
    patch stock_table_url(@stock_table), params: { stock_table: { ticker: @stock_table.ticker, user_id: @stock_table.user_id } }
    assert_redirected_to stock_table_url(@stock_table)
  end

  test "should destroy stock_table" do
    assert_difference('StockTable.count', -1) do
      delete stock_table_url(@stock_table)
    end

    assert_redirected_to stock_tables_url
  end
end
