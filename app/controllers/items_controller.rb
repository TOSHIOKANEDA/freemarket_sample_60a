class ItemsController < ApplicationController
  def index
  end
  
  def show
    @user = User.new
    @item = Item.find(1)
    # @item = Item.find(params[:id])
  end
end
