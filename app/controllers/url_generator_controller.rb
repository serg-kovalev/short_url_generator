class UrlGeneratorController < ApplicationController
  before_action :load_destination_link, only: [:show, :edit, :update, :destroy]
  def index
    @destination_links = DestinationLink.with_tracked_links.by_user(current_user)
  end

  def new
    @destination_link = DestinationLink.new
  end

  def show
  end

  def create
    @destination_link = DestinationLink.create(destination_link_params.merge(user: current_user))
    if @destination_link.persisted?
      @destination_link.tracked_links.create if @destination_link.new_tracked_link
      flash[:notice] = 'Destination Link created.'
      redirect_to action: :index
    else
      flash[:error] = 'Destination Link was not created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @destination_link.update(destination_link_params)
      @destination_link.tracked_links.create if @destination_link.new_tracked_link
      flash[:notice] = 'Destination Link updated.'
      redirect_to action: :index
    else
      flash[:error] = 'Destination Link was not updated.'
      render :new
    end
  end

  def destroy
    if @destination_link.destroy
      flash[:notice] = 'Destination Link was deleted.'
    else
      flash[:error] = 'Destination Link was not deleted.'
    end
    redirect_to action: :index
  end

  private

  def load_destination_link
    @destination_link = DestinationLink.with_tracked_links.by_user(current_user).find(params[:id])
  end

  def destination_link_params
    params.require(:destination_link).permit(:url, :new_tracked_link)
  end
end
