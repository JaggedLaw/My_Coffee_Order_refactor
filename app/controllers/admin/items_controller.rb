class Admin::ItemsController < Admin::BaseController

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:errors] = "Missing fields. Please try again."
      redirect_to new_admin_item_path
    end
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:update] = "Item has been updated"
      redirect_to admin_items_path
    else
      flash[:errors] = "Item did not update"
      redirect_to admin_items_path
    end
  end

  def destroy
    item = params[:id]
    Item.find(item).destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end

end
