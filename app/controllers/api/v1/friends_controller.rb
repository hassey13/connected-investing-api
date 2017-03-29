class Api::V1::FriendsController < ApplicationController
  # before_action :set_stock, only: [:show, :update, :destroy]

  def fetch_following
    @user = User.find_by(username: params[:username])
    if @user.friends.length > 0
      render json: @user.friends
    else
      render json: {no_friends: 'user has no friends'}
    end
  end

  def create
    @user = get_current_user
    @target_user = User.find_by(username: params[:username])
    @user.friends << @target_user
    render json: @user.friends
  end

  def destroy
    @user = get_current_user
    @target_user = User.find_by(username: params[:username])
    @user.friends.delete(User.find(@target_user.id)) if !!@target_user
    render json: @user.friends
  end

  private

end
