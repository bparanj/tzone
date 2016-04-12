class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(allowed_params)
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to products_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated product."
      redirect_to products_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_path
  end
  
  private
  
  def allowed_params
    params.require(:product).permit(:name, :released_at)
  end
end
