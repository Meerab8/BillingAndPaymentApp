# frozen_string_literal: true

module Api
  module V1
    class SubscriptionsController < ApplicationController
      def index
        @subscriptions = Subscription.all
        render json: @subscriptions
      end
    end
  end
end
