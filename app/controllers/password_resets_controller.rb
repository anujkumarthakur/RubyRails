class PasswordResetsController < ApplicationController
  def update_password
    @user = User2.find_by(email: params[:user2][:email])
    if @user
      @user.update(password: params[:user2][:password])

      redirect_to login_path, notice: "Password reset successful. Please log in with your new password."
    else
      flash.now[:alert] = "User with that email not found."
      render :new
    end
  end
end
