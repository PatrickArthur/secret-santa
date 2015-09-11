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
    @users <= 10
  end

  def assign_santa
    (santa_limit) ? (@user.need_more_santas) : (@user.assign_santa)
  end

  def request_valid?
    if @user.valid?
      assign_santa
      flash[:notice] = "Success"
      redirect_to secret_santas_path
    else
      flash[:alert] = "error"
      redirect_to secret_santas_path
    end
  end

end
