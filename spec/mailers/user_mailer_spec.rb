require 'rails_helper'

describe 'UserMailer', type: :mailer do
  let(:user) { create(:user) }
  let(:mail) { UserMailer.with(user: user).weekly_digest }

  it 'renders the headers' do
    expect(mail.subject).to eq('Your weekly digest from the chat room')
    expect(mail.to).to eq([user.email])
    expect(mail.from).to eq(['notifications@example.com'])
  end

  # TODO: Test the rest of this

  it 'sends an email' do
    expect { mail.deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
