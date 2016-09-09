class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json

  def index
    @most_items = Item.most_items(params[:quantity])
    respond_with @most_items
  end
end