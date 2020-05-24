class ProfileController < ApplicationController
  def home
  	# driver profile function
  	@user = DriverInfo.find(session[:user_id])
  	#if @user.is_verify == false
  	#	redirect_to '/profile/unverify'
  	#
  	#else

  	#end
  	puts @user.inspect
  end
  
end
