class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def profile
    unless user_signed_in?
       redirect_to :back
    end
  end

  def name
    @user_alias
  end
end
