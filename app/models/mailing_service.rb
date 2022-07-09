class MailingService
  def self.send_digest
    User.should_be_mailed.each do |user|
      UserMailer.with(user: user).weekly_digest.deliver_now
      user.update(last_mailed_at: Date.today)
    end
  end
end
