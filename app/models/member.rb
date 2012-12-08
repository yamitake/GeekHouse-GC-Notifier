class Member < ActiveRecord::Base
  attr_accessible :image, :name, :turn, :user_id
  belongs_to :user
end
