class SessionsController < ApplicationController

  def new
  end


  def create
    if params[:email].eql? "admin@gmail.com"
      if params[:password].eql? "admin"
        redirect_to "/admin/index"
        session[:user_id] = params[:email]
      else
        #flash[:errors] = ["Email id or password is wrong"]
      redirect_back fallback_location: "/"    
    end
  else
  # find the email id of driver  
  @user = DriverInfo.find_by(email: params[:email])
  #puts @user.authenticate(params[:password])
  #authenticate the user with email and password
  if @user && @user.authenticate(params[:password])
    #store into session 
    session[:user_id] = @user.id
    #if correct user is valid redirect to profile page
    redirect_to "/profile/home"
  #if password or email are miss match render error
  else
    flash[:errors] = ["Email id or password is wrong"]
    redirect_back fallback_location: "/"
    #redirect_to :back
  end
end
end

#logout called the destroy method will call
# it delete the session variable
def destroy
  reset_session
  redirect_to '/'
end

end