class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def index
    @category = Category.all.sort_by {|category| category.name}
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "New category created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
