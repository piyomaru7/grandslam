class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

  def user_params
    params.require(:user).permit(:user_name, :nickname, :position, :pitching, :age, :area, :year, :fan, :text)
  end
end
