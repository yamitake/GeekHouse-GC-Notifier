class Member < ActiveRecord::Base
  attr_accessible :image, :name, :turn, :user_id
  belongs_to :user
  #validates_associated :user
  validates :name, length: { maximum: 15 }
  validates :turn, presence: true, uniqueness: { scope: :user_id }

  #before_save do
  #  raise
  #end
end