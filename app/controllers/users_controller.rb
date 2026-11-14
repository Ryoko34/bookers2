class UsersController < ApplicationController
#未認証のアクセスを許可するためのメソッド
allow_unauthenticated_access only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save   # sign up後は新規登録画面かつマイページに遷移したい
      redirect_to new_session_path, notice: "Welcome! You have signed up successfully."
    else
      render :new, status: unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :profile_image, :introduction)
  end

end
