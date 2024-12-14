# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe FeaturesController, type: :controller do
  render_views
  let(:admin) { create(:admin) }
  let!(:feature) { create(:feature) }

  describe 'callbacks' do
    it { is_expected.to use_before_action(:set_feature) }
    # it { is_expected.to use_before_action(:feature_authorization) }
  end

  describe 'index' do
    before { sign_in admin }

    it 'renders index page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'tests index body' do
      get :index
      expect(response.body).to include('feature')
    end
  end

  describe 'new' do
    before { sign_in admin }

    it 'renders edit page' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'create' do
    before { sign_in admin }

    context 'when feature created' do
      it 'shows flash message' do
        post :create, params: { feature: FactoryBot.attributes_for(:feature) }
        expect(flash[:success]).to match('Feature created!')
      end

      it 'redirect to feature path' do
        post :create, params: { feature: FactoryBot.attributes_for(:feature) }
        expect(response).to redirect_to(features_path)
      end

      it 'update count by 1' do
        expect do
          post :create, params: { feature: FactoryBot.attributes_for(:feature) }
        end.to change(Feature, :count).by(1)
      end
    end

    context 'when fetaure not created' do
      it 'rendirect to feature path' do
        post :create, params: { feature: { name: nil } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'update' do
    before { sign_in admin }

    context 'when feature updated' do
      it 'shows flash message' do
        patch :update, params: { id: feature.id, feature: FactoryBot.attributes_for(:feature) }
        expect(flash[:success]).to match('Feature Updated!')
      end

      it 'redirect to feature path' do
        patch :update, params: { id: feature.id, feature: FactoryBot.attributes_for(:feature) }
        expect(response.status).to be 302
      end
    end

    context 'when feature not updated' do
      it 'renders template new' do
        patch :update, params: { id: feature.id, feature: { name: nil } }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'destroy' do
    before { sign_in admin }

    context 'when feature destroyed' do
      it 'shows flash message' do
        delete :destroy, params: { id: feature.id }
        expect(flash[:success]).to match('Feature was successfully destroyed.')
      end

      it 'redirect to features url' do
        delete :destroy, params: { id: feature.id }
        expect(response).to redirect_to(features_url)
      end

      it 'change count by -1' do
        expect do
          delete :destroy, params: { id: feature.id }
        end.to change(Feature, :count).by(-1)
      end
    end

    context 'when feature not destroyed' do
      it 'redirects to root path' do
        delete :destroy, params: { id: 45 }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
