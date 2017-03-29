class Api::V1::CommentsController < ApplicationController
  before_action :set_stock, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comments
  end

  # POST /comments
  def create
    @comments = Comment.new(comment_params)
    if @comments.save
      render json: @comments
    # grab current user here 
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comments.update(comment_params)
      render json: @comments

    end
  end

  # DELETE /comments/1
  def destroy
    @comments.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @comments = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:message, :stock_id, :user_id)
    end
end
