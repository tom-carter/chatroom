require 'rails_helper'

describe 'MailingService' do
  describe '.send_digest' do
    let!(:user) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:user_3) { create(:user, last_mailed_at: Date.yesterday) }
    subject { MailingService.send_digest }
    context 'when there are users' do
      it { expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(2) }
      # TODO: write some more explicit tests here.
    end
  end
end
