# encoding: UTF-8
desc "日本時間2時につぶやく用"
task :cron2 => :environment do
 include ActionView::Helpers::TextHelper
  #今日は第何週か
  number_week = (Time.now.mday/7) + 1
  #今日は何曜日か
  today_wday = Time.now.wday

  gomi_wday = today_wday

  tweets_weekly = Tweet.where( cron_week: gomi_wday, cron_number_week: nil )
  tweets_week_number = Tweet.where( cron_week: gomi_wday, cron_number_week:  number_week )

  weekly_bot_id = tweets_weekly.map(&:user_id)
  week_number_bot_id = tweets_week_number.map(&:user_id)

  weekly_user = User.where(id: weekly_bot_id)
  week_number_user = User.where(id: week_number_bot_id)

  weekly_user.each do |user|
    touban = user.members.where(turn: 1).first
    tweet = user.tweets.where(cron_week: gomi_wday, cron_number_week: nil).first
    touban.nil? ? name = nil : name = "@#{touban.name} さん"
    time = Time.now.strftime("%H時%M分です")
    message = "#{name} #{time} #{tweet.message}"
    twitter = Twitter::Client.new(oauth_token: user.access_token, oauth_token_secret: user.access_secret)
    twitter.update(truncate(message,length: 140))
  end
  week_number_user.each do |user|
    touban = user.members.where(turn: 1).first
    tweet = user.tweets.where(cron_week: gomi_wday, cron_number_week: number_week).first
    touban.nil? ? name = nil : name = "@#{touban.name} さん"
    time = Time.now.strftime("%H時%M分です")
    message = "#{name} #{time} #{tweet.message}"
    twitter = Twitter::Client.new(oauth_token: user.access_token, oauth_token_secret: user.access_secret)
    twitter.update(truncate(message,length: 140))
  end
end