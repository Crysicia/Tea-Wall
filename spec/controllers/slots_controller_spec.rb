# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlotsController, type: :controller do
  let(:user) { create(:user) }

  def login_user
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      login_user
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
