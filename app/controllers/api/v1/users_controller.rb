module Api
  module V1
class UsersController < ApplicationController
  respond_to :json
  def index
    @users=User.all
    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @users}
      end
  end

  def show
  @user= User.find(params[:id])

    respond_to do |format|
   # format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def create
  	 model = nil
    if !params[:user].blank? and !params[:user][:type].blank?
      model = params[:user].delete(:type).constantize.to_s
    end
    @user = Kase.new(params[:user])
    @user.type = model
  end
  end

  def new
  end

  def destroy
  end
end
end 
