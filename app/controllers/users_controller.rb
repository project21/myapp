class UsersController < ApplicationController
  def index
  end

  def create
  	 
  end

def show
    @user = User.find(params[:id])

  end


  def new
  end

  def destroy
  end
end
