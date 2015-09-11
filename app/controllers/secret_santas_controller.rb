# Comment
class SecretSantasController < ApplicationController
  def index
    @users = User.limit(20)
  end

  def new
    @user = user.new
  end

  def create
    @user.update_attributes(user_params)
    request_valid?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def santa_limit
    if @users <= 10
  end

  def assign_santa
    (santa_limit) ? (@user.need_more_santas) : (@user.assign_santa)
  end

  def request_valid?
    (@user.valid?) ? user_valid_assignments : flash[:alert] = 'Error'
    redirect_to secret_santas_path
  end

  def user_valid_assignments
    assign_santa
    flash[:notice] = 'Success'
  end
end
