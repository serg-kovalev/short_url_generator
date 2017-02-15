module Api
  module V1
    class BaseController < ApplicationController
      acts_as_token_authentication_handler_for User#, if: lambda { |controller| controller.request.format.json? }
    end
  end
end
