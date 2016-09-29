class Admin::CategoriesController < Admin::AdminController
  def index
    @scope = 'questions'
    @scope = params[:scope] unless params[:scope].blank?
    @categories = Category.where(scope: @scope)
    @categories = @categories.where(category_id: nil)
    params[:per] = 10 if params[:per].blank?
    @categories = @categories.page(params[:page]).per(params[:per])
  end


  def show
    @category = Category.find(params[:id])
    params[:per] = 10 if params[:per].blank?
    @categories = @category.categories.page(params[:page]).per(params[:per])
  end


  def update
    @category = Category.find(params[:id])
    @category.update(category_attributes)
    redirect_to admin_category_path(@category), notice: 'Aktualisiert'
  end

private
  def category_attributes
    params.require(:category).permit(:template)
  end
end
