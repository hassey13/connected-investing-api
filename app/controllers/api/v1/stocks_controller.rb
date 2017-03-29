class Api::V1::StocksController < ApplicationController
  # before_action

  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.all
    render json: @stock
  end

  def create
    @stock = Stock.create_with(company_name: stock_params[:company_name]).find_or_create_by(ticker: params[:ticker])
    if @stock.save
      date = "2017-02-16"
      get_current_user.stocks << @stock
      render json: {user: get_current_user.stocks, stock: @stock.users}
    end
  end

  def like
    @stock = Stock.find_by(ticker: params[:ticker])
    if @stock && get_current_user
      @like = Like.new(user_id: get_current_user.id, stock_id: @stock.id)
      @like.save
    end
    render json: { likes: @stock.likes }
  end

  def dislike
    @stock = Stock.find_by(ticker: params[:ticker])
    if @stock && get_current_user
      @dislike = Dislike.new(user_id: get_current_user.id, stock_id: @stock.id)
      @dislike.save
    end
    render json: { dislikes: @stock.dislikes }
  end

  def destroy_like
    @stock = Stock.find_by(ticker: params[:ticker])
    get_current_user.likes.find_by(stock_id: @stock.id).delete
    render json: { likes: @stock.likes }
  end

  def destroy_dislike
    @stock = Stock.find_by(ticker: params[:ticker])
    get_current_user.dislikes.find_by(stock_id: @stock.id).delete
    render json: { dislikes: @stock.dislikes }
  end

  def destroy
    @stock = Stock.find_by(ticker: params[:ticker])
    get_current_user.stock_users.find_by(stock_id: @stock.id).delete
    render json: { user: get_current_user.stocks, stock: @stock.users }
  end

  private

    def stock_params
      params.require(:stock).permit(:ticker, :company_name)
    end
end
