require 'rails_helper'
RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:handle) }
  it { is_expected.to have_many(:messages) }

  describe '#last_message_sent_time' do
    let(:user) { create(:user) }
    subject { user.last_message_sent_time }

    context 'when the user has no messages' do
      it {is_expected.to eq(user.created_at)}
    end

    context 'when the user has one message' do
      let!(:message) { create(:message, user: user) }
      it {is_expected.to eq(message.created_at)}
    end

    context 'when the user has more than one message' do
      let!(:message_2) do
        Timecop.freeze(Time.parse('2022-01-02')) do
          create(:message, user: user)
        end
      end
      let!(:message) do
        Timecop.freeze(Time.parse('2022-01-01')) do
          create(:message, user: user)
        end
      end

      it {is_expected.to eq(message_2.created_at)}
    end
  end
end
