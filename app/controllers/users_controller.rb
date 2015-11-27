class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username.capitalize}"
      redirect_to dashboard_path
    else
      flash[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    if current_user.admin?
      @admin = current_user
    else
      flash[:login_error] = "You must be an admin to edit"
      redirect_to "/"
    end
  end

  def update
    @admin = current_user
    if @admin.update(user_params)
      flash[:login_update] = "You have succesfully changed your account information"
      redirect_to admin_dashboard_index_path
    else
      flash[:errors] = "Your account information did not update"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :address, :city, :state, :zip)
  end
end
