class Member < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :image, :turn
end
