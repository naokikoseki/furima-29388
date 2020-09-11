class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render 'items/new'
    end
  end
end
