class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render 'new'
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
   @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :product_description, :genre_id, :tax_included_price, :is_sales)
  end

end
