# frozen_string_literal: true

module Api
  module V1
    class PlansController < ApplicationController
      def index
        @plans = Plan.all
        render json: @plans
      end

      def show
        @plan = Plan.find(params[:id])
        render json: @plan
      end
    end
  end
end
