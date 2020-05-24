class UserController < ApplicationController
  #require 'city-state'
  attr_accessor :password, :password_confirmation
  def home
  end
=begin
  def create
    puts params
    @u = User.new(new_user)

    if @u.save
      session[:user_id] = @u.id
      redirect_to "/auctions"
    else
      flash[:errors] = @u.errors.full_messages
      redirect_back fallback_location: "/"
      #redirect_to :back
    end
  end

  def subscribe
    @subscribe = Subscribe.new(:email => params[:email] )
    if @subscribe.save
      UserMailer.signup_confirmation(@subscribe).deliver_now
      redirect_to "/"
    else 
      redirect_to :back
    end
  end
=end
  def new
    
  end
  def book
    if request.post?
      puts params.inspect
    #  puts params[:destination]
      session[:source]=params[:source]
      session[:destination]=params[:destination]
      session[:truck_type]=params[:vechile_type]
      redirect_to "/user/register"
    else
      #@states = CS.states("India")
    end  
  end
  def register
      if request.post?
        #puts params.inspect
        @newdelivery=Newdelivery.new(new_delivery)
        #@newdelivery[:order_id]=
        @newdelivery[:delivery_id]=Time.now.strftime("%d%m%Y%H%M")+ @newdelivery[:phone_no].to_s
        @newdelivery[:source]=session[:source]
        @newdelivery[:destination]=session[:source]
        @newdelivery[:type]=session[:truck_type]
        puts "********"
        puts @newdelivery.inspect
        puts "********"
        
    if @newdelivery.save
      UserMailer.signup_confirmation(@newdelivery).deliver_now
      UserMailer.booked_confirmation(@newdelivery,@newdelivery[:email]).deliver_now
      session.delete(:truck_type)
      session.delete(:source)
      session.delete(:destination)

      redirect_to "/user/book"
     else
      flash[:errors] = @u.errors.full_messages
      redirect_back fallback_location: "/"
      redirect_to :back
    end
      else

      end


  end
  def customersignin
    if request.post?
      puts params.inspect
      puts "**************"
      @newuser=User.new(new_user)
    if @newuser.save
      session[:user_id] = @newuser.id
      redirect_to "/dashborad"
    else
      flash[:errors] = @u.errors.full_messages
      redirect_back fallback_location: "/"
      #redirect_to :back
    end
     # puts params.inspect
  #handle posts
    else
  #handle gets
    end
  end

  def driversignin
  if request.post?
      
      @newuser = DriverInfo.new(driver_new_user)
      puts @newuser.inspect
      if  @newuser.save
          session[:user_id] = @newuser.id
          redirect_to "/profile/home"
      else
          flash[:errors] = @newuser.errors.full_messages
          redirect_back fallback_location: "/"
      end  
    else
  #handle gets
    end
  end
  def edit
    @user = User.find(session[:user_id])
    if @user.address_id != nil
      @address = Address.find(@user.address_id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_user)
      redirect_back fallback_location: "/"
      #redirect_to :back
    else
      flash[:errors] = @user.errors.full_messages
      redirect_back fallback_location: "/"
      #redirect_to :back
    end
  end

  def destroy
  end
  private
    def driver_new_user
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,:occupation,:phone_number,:address,:city,:state,:pincode,:status,:vechile_no,:vechile_type)
    end

    def new_user
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,:occupation,:phone_number,:address,:city,:state,:pincode,:status,:vechile_no,:vechile_type)
    end

    def update_user
      params.require(:user).permit(:first_name, :last_name, :email, :company, :phone_number)
    end
    def new_delivery
      params.require(:user).permit(:email, :booked_by, :address, :city, :state, :pincode,:phone_no, :delivery_address, :contact_no)
    end
end
