class Public::ItemsController < ApplicationController
  def index

    @items = Item.all
    @items = Item.page(params[:page])
    if params[:latest]
      @items = Item.latest.page(params[:page]).per(8)
    elsif params[:old].present?
      @items = Item.old.page(params[:page]).per(8)
    # elsif params[:cheapest].present?
    #   @cheap_items = Item.cheapest.page(params[:page]).per(8)
    # elsif params[:expensive].present?
    #   @expensive_items = Item.expensive.page(params[:page]).per(8)
    else
      @items = Item.all.page(params[:page]).per(8)
    end

    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:ge_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    if params[:genre_id].present?
      #presentメソッドでparams[:ge_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @item = @genre.item
    end
  end
end
