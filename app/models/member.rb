class Member < ActiveRecord::Base
  attr_accessible :image, :name, :turn, :user_id
  belongs_to :user
  validates :name, length: { maximum: 15 }
  validates :turn, presence: true, if: :name.blank?
end
