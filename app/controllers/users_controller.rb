class UsersController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user

  end

  def show
    @user = User.find(params[:id])
    # IDでユーザーを探しに行く
    @books = @user.books
    # 上で取得したユーザーの本
    # ユーザーが投稿した本全てなのでbooks
    @book = Book.new
  end

  def edit
    @user = current_user
    @users = User.find(params[:id])
    unless @users.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    # アクションを切り替える
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
