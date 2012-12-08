class Tweet < ActiveRecord::Base
  attr_accessible :cron_week, :cron_number_week, :message, :user_id
  belongs_to :user
end
