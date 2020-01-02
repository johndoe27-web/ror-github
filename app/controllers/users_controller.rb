class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_admin, only: :destroy
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to edit_user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    flash[:info] = "Deleted user: #{user.email}"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_login
      unless logged_in?
        flash[:info] = "Please log in."
        redirect_to login_url
      end
    end

    def require_admin
      redirect_to(root_path) unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless @user == current_user
    end
end
