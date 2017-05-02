class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def list
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :age, :number_of_children,
                                 :location, :preferred_day, :course_preference, :comments)
  end
end
