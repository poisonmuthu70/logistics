class AdminController < ApplicationController
   def index
    @columns = ['id','souce', 'destination','booked_by']
    if params[:_search]
       @employees =   Newdelivery.search(params[:_search],params[:searchField],params[:searchString], params[:page],params[:rows],params[:searchOper],params[:sord])

    else
      @employees = Newdelivery.paginate(
      :page     => params[:page],
      :per_page => params[:rows])
     # :order    => order_by_from_params(params))
      #@employees = Newdelivery.paginate(page: params[:page], per_page: 10) 
       #@employees = Newdelivery.paginate( page: params[:page],per_page: 10)   
    end
    if request.xhr?
      render :json => json_for_jqgrid(@employees, @columns)
    end
  end
  def update
    if params[:oper] == 'add'
      @employee = Employee.create!({:name => params[:name],:contact => params[:contact],:date_of_join => params[:date_of_join]})
    elsif params[:oper] == 'edit'
      @employee = Employee.find(params[:id])
      @employee.update_attributes({:name => params[:name],:contact => params[:contact],:date_of_join => params[:date_of_join]})
    elsif params[:oper] == 'del'
      @employee = Employee.find(params[:id])
      @employee.destroy!
    end
    if request.xhr?
      render :json => @employee
    end
  end
end
=begin
def home
  
    if request.xhr?
    render :json => Newdelivery.to_jqgrid_json([:id,:delivery_id,:source,:destination,:type, :booked_by,:address, :city,:state, :pincode, :phone_no]) and return
    end
   # @details=Newdelivery.all
  #  if request.xhr?
  #    render :json => Newdelivery.to_jqgrid_json([:id,:name]) and return
  #  end
    #puts @datas
  end

  def index
  end

  def jqdata
     render :json => Newdelivery.to_jqgrid_json([:id,:delivery_id,:source,:destination,:type, :booked_by,:address, :city,:state, :pincode, :phone_no]) and return
  end
=end
=begin
  protect_from_forgery :except => [:post_data]
  
  # Don't forget to edit routes if you're using RESTful routing (see config/routes.rb)
  def pets
    
    # Queries are here for clarity purposes in this demo
    # It's of course a better idea to create a method in your model
    
    if params[:id].present?
      pets = User.find(params[:id]).pets.find(:all) do
        paginate :page => params[:page], :per_page => params[:rows]      
        order_by "#{params[:sidx]} #{params[:sord]}"        
      end
      total_entries = pets.total_entries
    else
      pets = []
      total_entries = 0
    end
    if request.xhr?
      render :json => pets.to_jqgrid_json([:id,:name], params[:page], params[:rows], total_entries) and return
    end
  end
  
  # Don't forget to edit routes if you're using RESTful routing (see config/routes.rb)
  def post_data
    
    # It's of course your role to add security / validation here
    
    if params[:oper] == "del"
      User.find(params[:id]).destroy
    else
      user_params = { :pseudo => params[:pseudo], :firstname => params[:firstname], :lastname => params[:lastname], 
                      :email => params[:email], :role => params[:role] }
      if params[:id] == "_empty"
        user = User.create(user_params)
      else
        user = User.find(params[:id])
        user.update_attributes(user_params)
      end
    end
    
    # If you need to display error messages
    err = ""
    if user
      user.errors.entries.each do |error|
        err << "<strong>#{error[0]}</strong> : #{error[1]}<br/>"
      end
    end
    
    render :text => "#{err}"
  end

  def index

    # Queries are here for clarity purposes in this demo
    # It's of course a better idea to create a method in your model

    users = User.find(:all) do
      if params[:_search] == "true"
        pseudo    =~ "%#{params[:pseudo]}%" if params[:pseudo].present?
        firstname =~ "%#{params[:firstname]}%" if params[:firstname].present?
        lastname  =~ "%#{params[:lastname]}%" if params[:lastname].present?                
        email     =~ "%#{params[:email]}%" if params[:email].present?
        role      =~ "%#{params[:role]}%" if params[:role].present?        
      end
      paginate :page => params[:page], :per_page => params[:rows]      
      order_by "#{params[:sidx]} #{params[:sord]}"
    end
    if request.xhr?
      render :json => users.to_jqgrid_json([:id,:pseudo,:firstname,:lastname,:email,:role], params[:page], params[:rows], users.total_entries) and return
    end
  end
=end
#end
