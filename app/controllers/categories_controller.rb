class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
# before_action :check_is_admin, except: [:index,:show]
  def index
    @categories = Category.all
   
end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit(:name))
    if @category.save
      redirect_to categories_path
    else
      render action: "new"
    end
  end

  def show
    
    @category = Category.find(params[:id])
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category].permit(:name))
      redirect_to categories_path
    else
      render action: "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end
