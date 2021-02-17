class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, only:[:edit,:update]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @products.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :price, :category_id, :product_state_id, :freight_burden_id, :area_id, :lead_time_id).merge(user_id: current_user.id)
  end

  def set_product
    @products = Product.find(params[:id])
  end

  def move_to_index
    unless current_user == @products.user
     redirect_to root_path
    end
  end

end
