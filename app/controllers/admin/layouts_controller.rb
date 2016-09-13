class Admin::LayoutsController < Admin::AdminController

  before_action :find_layout, only: [:destroy, :show,:edit, :update]

  def index
    @layouts = Layout.page(params[:page]).per(params[:per])
  end

  def show
  end


  def new
    @layout = Layout.new
  end

  def edit
  end

  def update
    if @layout.update(layout_attributes)
      redirect_to admin_layout_path(@layout)
    else
      render 'edit'
    end
  end

  def create
    @layout = Layout.new(layout_attributes)
    if @layout.save
      redirect_to admin_layout_path(@layout)
    else
      render 'new'
    end
  end

  def destroy
    @layout.destroy
    redirect_to admin_layouts_path
  end

private

  def find_layout
    @layout = Layout.find(params[:id])
  end

  def layout_attributes
    params.require(:layout).permit(:name, :template, layout_parts_attributes: [:id, :name])
  end

end
