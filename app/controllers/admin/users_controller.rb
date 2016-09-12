class Admin::UsersController < Admin::AdminController
  load_and_authorize_resource
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page]).per(params[:per])
  end


  def show

  end

  def edit
  end

  def update
    if @user.update(user_attributes)
      redirect_to admin_user_path(@user), :flash => { :info => "Benutzer Daten wurden aktualisiert" }
    else
      flash.now[:error] = "Benutzer Daten konnte nicht gespeichert werden"
      render 'edit'
    end
  end
#

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_attributes
    params.require(:user).permit(:name, :avatar, :email, :role_ids => [], :working_scopes_attributes => [:id, :user_id, :category_id])
  end

end
