class StockTablesController < ApplicationController
  before_action :set_stock_table, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /stock_tables
  # GET /stock_tables.json
  def index
    @stock_tables = StockTable.all
  end

  # GET /stock_tables/1
  # GET /stock_tables/1.json
  def show
  end

  # GET /stock_tables/new
  def new
    @stock_table = StockTable.new
  end

  # GET /stock_tables/1/edit
  def edit
  end

  # POST /stock_tables
  # POST /stock_tables.json
  def create
    @stock_table = StockTable.new(stock_table_params)

    respond_to do |format|
      if @stock_table.save
        format.html { redirect_to @stock_table, notice: 'Stock table was successfully created.' }
        format.json { render :show, status: :created, location: @stock_table }
      else
        format.html { render :new }
        format.json { render json: @stock_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_tables/1
  # PATCH/PUT /stock_tables/1.json
  def update
    respond_to do |format|
      if @stock_table.update(stock_table_params)
        format.html { redirect_to @stock_table, notice: 'Stock table was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_table }
      else
        format.html { render :edit }
        format.json { render json: @stock_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_tables/1
  # DELETE /stock_tables/1.json
  def destroy
    @stock_table.destroy
    respond_to do |format|
      format.html { redirect_to stock_tables_url, notice: 'Stock table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @ticker = current_user.stock_tables.find(id: params[:id])
    redirect_to stock_tables_path, notice: "You are not authorized to edit this stock" if @ticker.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_table
      @stock_table = StockTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_table_params
      params.require(:stock_table).permit(:ticker, :user_id)
    end
end
