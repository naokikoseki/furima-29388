class PurchasesController < ApplicationController
  def index
    if user_signed_in?
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    else
      redirect_to 'devise/sessions/new'
    end
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      return redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def purchase_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
