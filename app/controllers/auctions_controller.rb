class AuctionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @auctions = Auction.all.order("created_at ASC").limit(10).where(status: "New")
  end

  def new
    @user = User.find(session[:user_id])
  end
  def create
    @user = User.find(session[:user_id])
    @new_auction = Auction.new(new_auction)
    if @new_auction.save
      redirect_to '/auctions'
    else
      flash[:errors] = @new_auction.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @auction_find = Auction.find(params[:id])
    @auction_history = Auction.find(params[:id]).bids.order("created_at DESC").limit(10)
    @last_bid = Auction.find(params[:id]).bids.order("created_at DESC").limit(1).select(:price).first
    @user = User.find(session[:user_id])
    @pastauctions = Auction.where.not(status:new)
    @my_auctions = Auction.where(user: current_user )
    @all_auctions = Auction.all

    # test
    geocodio = Geocodio::Client.new('07980857e0feeaa078509a098a8078e60509d99')
    results = geocodio.geocode(['175 E Olive Ave, Burbank, CA 91502'])
    @results = results.best
  end
  def edit
  end
  def update
  end

  def destroy
     Auction.find(params[:id]).delete
     redirect_to '/auctions'
  end
  private
    def new_auction
      params.require(:auction).permit(:title, :description, :minimum_price, :address_id, :user_id)
    end
end