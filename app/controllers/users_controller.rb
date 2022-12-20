class UsersController < ApplicationController
  load_and_authorize_resource, except = [:index, :new_login , :new]
  # before_action :check_user, only: [:new, :new_login]
  # before_action :authenticate_user!

  def index
    @users = User.all
    @managers = User.with_role(:travels)
    @q = Bus.ransack(params[:q])
    @buses = @q.result(distinct: true).page(params[:page])
  end

  # def new_login
  # end

  # def login
  #   debugger
  #   @user = User.where(email: params['email'],password: params['password']).last
  #   if @user.present?
  #     session[:user_id]= @user.id
  #     if @user.has_role? :admin
  #       redirect_to root_path, success: "Admin Logged In Successfully!"
  #     else
  #       redirect_to buses_path, success: "You Logged In Successfully!"
  #     end
  #   else
  #     redirect_to new_login_users_path, danger: "Please provide Valid Cedentials!"
  #   end
  # end

  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # Enqueue a job to be performed 1 minute from now.
      EmailerJob.set(wait: 1.minute).perform_later(@user.id) 
      flash[:success] = "User created Successfully"
      redirect_to new_login_users_path
    else
      render new_user_path, status: :unprocessable_entity
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user.id)
    else
      render edit, status: :unprocessable_entity
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  # def signout
  #   session[:user_id] = nil
  #   redirect_to root_path, danger: "Successfully Logged Out!"
  # end

  def change_status
    @user = User.find(params[:id])
    if params[:status].present? && User::STATUSES.include?(params[:status])
      @user.update(status: params[:status])
    end
    redirect_to '/admin/dashboard', notice: "Status updated to #{@user.status}"
  end

  private
  def user_params
    params.require(:user).permit(:full_name,:email,:password,:role_id,:contact,:age,:gender)
  end

  # def check_user
  #   if @current_user.present?
  #     redirect_to root_path
  #   end
  # end
end
