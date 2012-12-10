# encoding: UTF-8
desc "cron"
task :cron => :environment do
  user = User.find(1)
  client = Twitter::Client.new(oauth_token: user.access_token, oauth_token_secret: user.access_secret)
  client.update("cronのテストだよ〜〜〜〜 @kitaindia")
end