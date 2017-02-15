module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :authenticate_user!
      acts_as_token_authentication_handler_for User#, if: lambda { |controller| controller.request.format.json? }
      respond_to :json
    end
  end
end
