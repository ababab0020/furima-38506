class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :set_item, only: [:show, :edit, :update, :destroy]
 
   def index
     #@items = Item.includes(:user).order('created_at DESC')
   end
 
   def new
     @item = Item.new
   end
 
   def create
     @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else
       render :new
     end
   end
 
   #def edit
   #end
 
   #def update
   #end
 
   #def show
   #end
 
   #def destroy
   #end
   
   private
 
   def item_params
     params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :delivery_price_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
   end
 
   #def set_item
     #@item = Item.find(params[:id])
   #end
 end
