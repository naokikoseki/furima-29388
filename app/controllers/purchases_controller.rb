class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only:[:index, :new, :create]
  before_action :set_purchase, only:[:index, :new]

  def index
    if @item.user.id == current_user.id || @item.purchase
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purchase
    @purchase = PurchaseAddress.new
  end

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id, :authenticity_token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
