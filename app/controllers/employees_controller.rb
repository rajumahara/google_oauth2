class EmployeesController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(user_id: params[:id])
  end

  def edit
  end

  def update 
    @user = User.find_by(user_id: params[:id])
    @user.update(full_name: params[:user][:full_name])
    redirect_to root_path
  end
end
