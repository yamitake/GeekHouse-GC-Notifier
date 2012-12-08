# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    message "MyString"
    cron_time "2012-11-26 00:59:47"
    user_id 1
  end
end
