class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, ]

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

  private

  def product_params
    params.require(:product).permit(:image, :product_name, :product_description, :price, :category_id, :product_state_id, :freight_burden_id, :area_id, :lead_time_id).merge(user_id: current_user.id)
  end

end
