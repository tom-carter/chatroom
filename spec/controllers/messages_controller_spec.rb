require 'rails_helper'

describe MessagesController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:params) { { message: {body: 'This is the message' }} }

    subject { post :create, params: params }

    it_behaves_like 'it is an authenticated page'
  end
end
