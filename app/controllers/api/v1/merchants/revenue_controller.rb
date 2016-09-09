class Api::V1::Merchants::RevenueController < ApplicationController
  include ActionView::Helpers::NumberHelper  
  respond_to :json
  
  def index
    @merchants = Merchant.order_by_revenue(params[:quantity].to_i)
    respond_with @merchants
  end
  
  def show
    merchant = Merchant.find(params[:id])
    if params[:date]
      @revenue = merchant.revenue_on(params[:date].to_date)
    else
      @revenue = merchant.total_revenue
    end
    response = {}
    response["revenue"] = number_with_precision(@revenue, precision: 2).to_s
    respond_with response
  end
  
  def date
    @revenue = Transaction.revenue_on_date(params[:date].to_date)
    respond_with number_with_precision(@revenue, precision: 2)
  end
end