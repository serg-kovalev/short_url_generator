module Api
  module V1
    class UrlGeneratorController < V1::BaseController
      before_action :load_destination_link, only: [:show, :update, :destroy]

      def dashboard
        @tracked_links = TrackedLink.includes(destination_link: :user).where(users: {id: current_user.id }).
            where('visits_count > ?', 0).order(visits_count: :desc)
        render json: @tracked_links
      end

      def index
        @destination_links = DestinationLink.with_tracked_links.by_user(current_user)
        render json: @destination_links
      end

      def show
        render json: @destination_link
      end

      def create
        @destination_link = DestinationLink.create(destination_link_params.merge(user: current_user))
        if @destination_link.persisted?
          @destination_link.tracked_links.create if @destination_link.new_tracked_link
          render json: @destination_link
        else
          render json: { errors: @destination_link.errors }, status: 422
        end
      end

      def update
        if @destination_link.update(destination_link_params)
          @destination_link.tracked_links.create if @destination_link.new_tracked_link
          render json: @destination_link
        else
          render json: { errors: @destination_link.errors }, status: 422
        end
      end

      def destroy
        if @destination_link.destroy
          render json: {}
        else
          render json: { errors: @destination_link.errors }, status: 422
        end
      end

      def tracked_links
        @tracked_links = TrackedLink.includes(destination_link: :user).where(users: {id: current_user.id })
        render json: @tracked_links
      end

      def tracked_link_details
        @tracked_link = TrackedLink.includes(destination_link: :user).
            where(users: {id: current_user.id }).find_by_tracked_url!(params[:tracked_url])
        ip_addresses = TrackedLinkAudit.where(tracked_link_id: @tracked_link.id).pluck('DISTINCT ip_address')
        IpApiCache.load_info_for_ips(ip_addresses - IpApiCache.where(ip_address: ip_addresses).pluck(:ip_address))
        @results_by_country = TrackedLinkAudit.joins(:ip_api_cache).where(tracked_link_id: @tracked_link.id).
            group(:country).count.sort_by { |e| -e.last }
        render json: @results_by_country
      end

      private

      def load_destination_link
        @destination_link = DestinationLink.with_tracked_links.by_user(current_user).find(params[:id])
      end

      def destination_link_params
        params.require(:destination_link).permit(:url, :new_tracked_link)
      end
    end
  end
end
