class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def yahoo
    # You need to implement the method below in your model (e.g. app/models/admin.rb)
    @token = Admin.from_omniauth(request.env["omniauth.auth"])['token']


    redirect_to '/blog'


    # if @admin.persisted?
    #   sign_in_and_redirect @admin, :event => :authentication #this will throw if @admin is not activated
    #   set_flash_message(:notice, :success, :kind => "Yahoo") if is_navigational_format?
    # else
    #   session["devise.yahoo_data"] = request.env["omniauth.auth"]
    #   redirect_to new_admin_registration_url
    # end
  end

  def failure
    redirect_to root_path
  end
end