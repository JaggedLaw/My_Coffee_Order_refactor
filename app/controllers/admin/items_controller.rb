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
    @item.update(title: params[:item][:title], description: params[:item][:description], price: params[:item][:price], image: params[:item][:image])
    redirect_to admin_items_path
    #NEEDTO Add validations and an else if an update doesn't save
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end

end
