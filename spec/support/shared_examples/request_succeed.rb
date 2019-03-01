# frozen_string_literal: true

shared_examples_for "request succeed" do |template|
  it { is_expected.to respond_with(200) }
  it { is_expected.to render_template template }
  it { is_expected.to render_with_layout :application }
end
