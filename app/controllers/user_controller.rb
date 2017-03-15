class UserController < ApplicationController
  # Hitelesítés?
  load_and_authorize_resource

  def index
    # Az aktuális felhasználót ne számítsa bele!
    @users = User.except(:id => current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Felhasználó sikeresen hozzáadva!"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update(user_params)
      flash[:notice] = "Felhasználó sikeresen módosítva!"
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Felhasználó sikeresen törölve!"
      redirect_to root_path
    end
  end

  protected

  def user_params
    params.require(:user).permit(:admin, :username, :email, :password, :password_confirmation)
  end

end
