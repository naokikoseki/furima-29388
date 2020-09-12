class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render 'items/new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category, :status, :fee, :region, :shipment_day, :price).merge(user_id: current_user.id)
  end
end
