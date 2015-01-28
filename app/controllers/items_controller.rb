class ItemsController < ApplicationController
  def index
    @items = item_filter(params["Filter"])
    # @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  private

  def item_filter(filter)
    @filter = filter ||= "name"
    Item.all.order(filter.to_sym)
  end
end
