class Tweet < ActiveRecord::Base
  berongs_to :user
  berongs_to :turn
  # attr_accessible :title, :body
end
