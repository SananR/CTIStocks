class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        render 'users/my_friends'
      else
        flash[:alert] = "Could not find any users with that name or email"
        redirect_to my_friends_path
      end
    else
      flash[:alert] = "Please enter a valid name or email to search"
      redirect_to my_friends_path
    end
  end
end
