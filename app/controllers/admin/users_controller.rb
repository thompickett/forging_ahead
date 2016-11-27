class Admin::UsersController < AdminController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/admin/dashboard'
    else
      redirect_to 'admin/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
