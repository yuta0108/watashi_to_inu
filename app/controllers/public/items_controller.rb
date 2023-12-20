class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
    # ソート機能
    if params[:latest]
      @items = @items.latest
    elsif params[:old].present?
      @items = @items.old
    end
    # ジャンル機能
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end

    @items = @items.page(params[:page]).per(8)

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
