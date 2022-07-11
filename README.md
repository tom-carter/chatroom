# README FOR FONIX RECRUITMENT TEST

* Ruby version

This is tested with 2.7.5 - probably works with other Rubys but not sure. 

* System dependencies

1. Redis

2. SQLite3

* Set up

`bundle install`

`rake db:migrate`

`rails s`

Then visit http://127.0.0.1:3000

* Email

I've been using Mailcatcher to handle email in development environment.
https://mailcatcher.me

To set it up run:
```ruby
gem install mailcatcher
mailcatcher
```

Then read emails on http://127.0.0.1:1080/
The development configuration is set up to send emails to the correct port.

* Part 3 - sending a weekly email.

I assume that the test does not require me to actually add a cron job (this is something very hard to achieve when I don't know the system it will be run on). So I have provided a rake task.
Typically you might add something to Cron:

```
5 8 * * Mon /bin/bash -l -c 'cd /path/to/your/project && RAILS_ENV=<RAILS_ENV> bundle exec rake mailing:weekly_digest >> log/cron.log 2>&1'
```

You can run the rake task manually like this:

`rake mailing:weekly_digest`
