class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, only:[:edit]

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
    @products = Product.find(params[:id])
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    @products = Product.find(params[:id])
    if @products.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def move_to_index
    @products = Product.find(params[:id])
    unless current_user == @products.user
     redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :price, :category_id, :product_state_id, :freight_burden_id, :area_id, :lead_time_id).merge(user_id: current_user.id)
  end

end
