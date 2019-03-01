# frozen_string_literal: true

shared_examples "logged out" do
  it { is_expected.to respond_with(302) }
  it { is_expected.to redirect_to new_user_session_path }
  it { is_expected.to set_flash.to('Vous devez vous connecter ou vous enregistrer pour continuer.') }
end
