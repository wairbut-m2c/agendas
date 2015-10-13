class UsersController < AdminController
  before_action :load_holders
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.includes(:manages => :holder).active.user.order("last_name asc")
  end

  def create
    @user = User.new(user_params)
    @user.password = Faker::Internet.password(8)
    if @user.save
      @user.user!
      redirect_to edit_user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :id, manages_attributes: [:id, :user_id, :holder_id, :_destroy])
  end

  def load_holders
    @holders = Holder.all.order("last_name asc")
  end

end
