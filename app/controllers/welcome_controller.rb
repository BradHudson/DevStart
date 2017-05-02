class WelcomeController < ApplicationController

  def index
    @user = User.new
  end

  def success
    render 'successful_signup'
  end
end
