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

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end

end
