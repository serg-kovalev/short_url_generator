class UrlGeneratorController < ApplicationController
  before_action :load_destination_link, only: [:edit, :update, :destroy]
  def index
    @destination_links = DestinationLink.with_tracked_links.by_user(current_user)
  end

  def new
    @destination_link = DestinationLink.new(user: current_user)
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def load_destination_link
    @destination_link = DestinationLink.with_tracked_links.by_user(current_user).find(params[:id])
  end
end
