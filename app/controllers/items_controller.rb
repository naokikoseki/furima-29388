class ItemsController < ApplicationController
  before_action :move_to_index, except:[:index, :show]
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      return redirect_to root_path
    else
      render 'items/new'
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category, :status, :fee, :region, :shipment_day, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
