namespace :mailing do
  desc "This rake task sends out the weekly digest of messages."
  task weekly_digest: :environment do
    MailingService.send_digest
  end
end
