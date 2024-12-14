# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_feature, except: %i[index new create]
  # before_action :feature_authorization

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.create(feature_params)
    if @feature.save
      flash[:success] = 'Feature created!'
      redirect_to features_path
    else
      @errors = @feature.errors.full_messages
      render :new
    end
  end

  def update
    if @feature.update(feature_params)
      flash[:success] = 'Feature Updated!'
      redirect_to feature_path(@feature)
    else
      @errors = @feature.errors.full_messages
      render :edit
    end
  end

  def destroy
    return unless @feature.destroy

    redirect_to features_url
    flash[:success] = 'Feature was successfully destroyed.'
  end

  private

  def feature_authorization
    authorize Feature
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
  end
end
