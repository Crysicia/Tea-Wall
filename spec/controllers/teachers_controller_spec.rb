# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  let(:user) { create(:user) }
  let!(:teacher) { create(:teacher) }

  def login_user
    sign_in user
  end

  describe "GET #index" do
    context "when user is logged in" do
      before do
        login_user
        get :index
      end

      include_examples "request succeed", :index
    end

    context "when user is logged out" do
      before do
        get :index
      end

      include_examples "logged out"
    end
  end

  describe "GET #edit" do
    context "when user is logged in" do
      before do
        login_user
        get :edit, params: { id: teacher }
      end

      include_examples "request succeed", :edit
    end

    context "when user is logged out" do
      before do
        get :edit, params: { id: teacher }
      end

      include_examples "logged out"
    end
  end

  describe "PUT #update" do
    context "when user is logged in" do
      context "when params are valids" do # rubocop:disable RSpec/NestedGroups
        before do
          login_user
          put :update, params: { id: teacher, teacher: { first_name: "Space", last_name: "Concept" } }
          teacher.reload
        end

        it { expect(teacher.first_name).to eq("Space") }
        it { expect(teacher.last_name).to eq("Concept") }
        it { is_expected.to set_flash.to('Modification enregistrée') }
        it { is_expected.to redirect_to teachers_path }
      end

      context "when params are invalids" do # rubocop:disable RSpec/NestedGroups
        before do
          login_user
          put :update, params: { id: teacher, teacher: { first_name: "", last_name: "Concept" } }
          teacher.reload
        end

        it { is_expected.to render_template :edit }
      end
    end

    context "when user is logged out" do
      before do
        get :edit, params: { id: teacher, teacher: { first_name: "Space", last_name: "Concept" } }
      end

      include_examples "logged out"
    end
  end

  describe "DELETE #destroy" do
    context "when user is logged in" do
      subject { -> { delete :destroy, params: { id: teacher } } }

      before do
        login_user
      end

      it { is_expected.to change(Teacher, :count).by(-1) }
    end

    context "when user is logged out" do
      before do
        delete :destroy, params: { id: teacher }
      end

      include_examples "logged out"
    end
  end
end
