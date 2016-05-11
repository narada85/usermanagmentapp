class UsersController < ApplicationController
  def index
    unless params[:search_txt].blank?
      @users = User.where("users.name like ? OR users.email like ?", "%#{params[:search_txt]}%", "%#{params[:search_txt]}%")
    else
      @users = User.all.order(:created_at)
    end
  end
  
  def show
    @user = User.where(:id => params[:id]).first
    
    unless @user
      redirect_to root_path
    end
  end
end

