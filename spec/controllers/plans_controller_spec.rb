# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PlansController, type: :controller do
  render_views
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:plan) { create(:plan) }
  let!(:subscription) { create(:subscription, user_id: user.id) }

  describe 'callbacks' do
    it { is_expected.to use_before_action(:set_plan) }
    # it { is_expected.to use_before_action(:plan_authorization) }
  end

  describe 'index' do
    before { sign_in user }

    it 'renders index page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'tests index body' do
      get :index
      expect(response.body).to include('plan')
    end
  end

  describe 'new' do
    before { sign_in admin }

    it 'renders new page' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'create' do
    before { sign_in admin }

    context 'when plan created' do
      it 'shows flash message' do
        post :create, params: { plan: FactoryBot.attributes_for(:plan) }
        expect(flash[:success]).to match('Plan created!')
      end

      it 'redirects to plans path' do
        post :create, params: { plan: FactoryBot.attributes_for(:plan) }
        expect(response).to redirect_to(plans_path)
      end

      it 'update count by 1' do
        expect do
          post :create, params: { plan: FactoryBot.attributes_for(:plan) }
        end.to change(Plan, :count).by(1)
      end
    end

    context 'when plan not created' do
      it 'renders template new' do
        post :create, params: { plan: { name: nil } }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'update' do
    before { sign_in admin }

    context 'when plan updated' do
      it 'shows flash message' do
        patch :update, params: { id: plan.id, plan: FactoryBot.attributes_for(:plan) }
        expect(flash[:success]).to match('Plan Updated!')
      end

      it 'redirects to plan_path' do
        patch :update, params: { id: plan.id, plan: FactoryBot.attributes_for(:plan) }
        expect(response.status).to be 302
      end
    end

    context 'when plan not updated' do
      it 'renders template new' do
        patch :update, params: { id: plan.id, plan: { name: nil } }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'destroy' do
    before { sign_in admin }

    context 'when plan destroyed' do
      it 'shows flash message' do
        delete :destroy, params: { id: plan.id }
        expect(flash[:success]).to match('Plan was successfully destroyed.')
      end

      it 'redirects to plans url' do
        delete :destroy, params: { id: plan.id }
        expect(response.status).to be 302
      end

      it 'change count by -1' do
        expect do
          delete :destroy, params: { id: plan.id }
        end.to change(Plan, :count).by(-1)
      end
    end

    context 'when plan not destroyed' do
      it 'redirects to index url' do
        delete :destroy, params: { id: 45 }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'subscribe' do
    before { sign_in user }

    context 'when plan subscribed' do
      it 'update subscription count by 1' do
        expect do
          get :subscribe_plan, params: { user_id: user.id, id: plan.id }
        end.to change(Subscription, :count).by(1)
      end

      it 'checks if job enqued' do
        expect do
          get :subscribe_plan, params: { user_id: user.id, id: plan.id }
        end.to have_enqueued_job(BillPaymentJob).exactly(:once)
      end

      it 'redirects to plans path' do
        get :subscribe_plan, params: { user_id: user.id, id: plan.id }
        expect(response.status).to be 302
      end
    end
  end

  describe 'unsubscribe' do
    before { sign_in user }

    context 'when plan unsubscribed' do
      it 'update subscription count by -1' do
        expect do
          delete :unsubscribe_plan, params: { id: subscription.plan_id }
        end.to change(Subscription, :count).by(-1)
      end

      it 'checks notice message' do
        delete :unsubscribe_plan, params: { id: subscription.plan_id }
        expect(flash[:success]).to match('Plan was successfully Unsubscribed.')
      end

      it 'redirects to plans url' do
        delete :unsubscribe_plan, params: { id: subscription.plan_id }
        expect(response.status).to be 302
      end
    end

    context 'when plan not unsubscribed' do
      it 'redirects to root path' do
        delete :unsubscribe_plan, params: { id: 468 }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
