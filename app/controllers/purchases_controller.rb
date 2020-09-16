class PurchasesController < ApplicationController
  def index
    if user_signed_in?
    @item = Item.find(params[:item_id])
    else
      redirect_to 'devise/sessions/new'
    end
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new
    if @purchase.save
      return render 'root_path'
    else
      redirect_to action: :index
    end
  end
end
