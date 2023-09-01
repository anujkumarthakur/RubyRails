class User2sController < ApplicationController
  def new
    @user2 = User2.new
  end

  def create
    @user2 = User2.new(user2_params)

    if @user2.save
      session[:user2_id] = @user2.id
      redirect_to "/", notice: 'User2 created successfully.'
    else
      render :new
    end
  end

  def login
  end

  def authenticate
    @user2 = User2.find_by(username: params[:user2][:username])

    if @user2 && @user2.password == params[:user2][:password]
      session[:user2_id] = @user2.id
      redirect_to "/", notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :login
    end
  end

  def logout
  end

  private

  def user2_params
    params.require(:user2).permit(:username, :password, :email, :birthdate)
  end
end
