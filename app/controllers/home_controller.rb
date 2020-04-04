class HomeController < ApplicationController
  def index
  	@api =StockQuote::Stock.new(api_key:'pk_72a2fb0cbe3746f9869108bc50f2a036')
    if params[:ticker] == ""
        @nothing = "You forgot to enter a symbol."
    elsif params[:ticker]
        begin
            @stock = StockQuote::Stock.quote(params[:ticker])
        rescue RuntimeError => @errorMsg
            @error = "That company symbol does not exist."
        end
    end

  end

  def about
  end

end
