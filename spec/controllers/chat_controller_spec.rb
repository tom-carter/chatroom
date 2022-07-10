require 'rails_helper'

describe ChatController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    let(:user) { create(:user) }

    subject { get :index }

    it_behaves_like 'it is an authenticated page'
  end
end
