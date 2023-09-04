class User2sController < ApplicationController
  before_action :authenticate_user, except: [:dashboard, :new, :create, :login, :authenticate]
  def new
    @user2 = User2.new
  end

  def create
    @user2 = User2.new(user2_params)

    if @user2.save
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
      redirect_to "/", notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :login
    end
  end

  # def logout
  #   puts "Logout action called"
  #   session[:user2_id] = nil
  #   redirect_to login_path, notice: 'Logged out successfully.'
  # end
  
  # def dashboard
  #   if session[:user2_id]
  #   else
  #     flash[:alert] = 'Please log in.'
  #     redirect_to login_path
  #   end
  # end
  private

  def user2_params
    params.require(:user2).permit(:username, :password, :email, :birthdate)
  end

  def authenticate_user
    unless session[:user2_id]
      flash[:alert] = 'Please log in.'
      redirect_to login_path unless action_name.in?(['login', 'new'])
    end
  end

end
