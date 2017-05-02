class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/success'
    else
      flash[:error] = "There was an Error Saving your submission. Please resubmit with Name and Email."
      redirect_to '/'
    end
  end

  def list
    @users = User.find_each
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :age, :number_of_children,
                                 :location, :preferred_day, :course_preference, :comments)
  end
end
