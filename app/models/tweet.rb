class Tweet < ActiveRecord::Base
  attr_accessible :cron_week, :cron_number_week, :message, :user_id
  belongs_to :user

  validates :message,          length: { maximum: 140 }
  validates :cron_week,        numericality: {greater_than_or_equal_to: 0,
                                              less_than_or_equal_to: 6}
  validates :cron_number_week, numericality: {greater_than_or_equal_to: 1,
                                              less_than_or_equal_to: 4}
end
