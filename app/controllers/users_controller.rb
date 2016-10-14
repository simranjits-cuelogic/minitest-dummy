class UsersController < ApplicationController

  def new
    @user = User.new(name: 'Dummy')

    render nothing: true
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to user_path(@user)
  end

  def destroy
    User.find_by(id: params[:id]).try(:destroy)
    # redirect_to users_path
    redirect_to users_path
  end

  def index

  end

  def show
    @users = User.all #assign nil to fail case
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :address)
  end
end
