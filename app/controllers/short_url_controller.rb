class ShortUrlController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    tracked_link = TrackedLink.with_destination_link.find_by(tracked_url: params[:short_url])
    if tracked_link
      tracked_link.visit_event(ip_address: request.remote_ip)
      redirect_to tracked_link.destination_link.url
      return
    end
    redirect_to root_url
  end
end
