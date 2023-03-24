class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = @user.posts
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
  end

  def update
    if @user.valid?
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :nickname, :position, :pitching, :age, :area, :year, :fan, :text, :avatar)
  end
end
