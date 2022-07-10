shared_examples_for 'it is an authenticated page' do
  context 'when the user is not signed in' do
    it 'fails' do
      subject
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context 'when a user is signed in' do
    before do
      sign_in(user)
    end
    context 'when there is a message' do

      it 'should fail' do
        subject
        expect(response).to be_successful
      end
    end
  end
end
