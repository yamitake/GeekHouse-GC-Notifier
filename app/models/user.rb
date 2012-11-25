class User < ActiveRecord::Base
  rolify
  has_many :members
  accepts_nested_attributes_for :members, :reject_if => :all_blank, :allow_destroy => true
  has_many :tweets
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :database_authenticatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :password, :uid, :provider, :image
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.info.nickname,
                         provider:auth.provider,
                         uid:auth.uid,
                         password:Devise.friendly_token[0,20],
                         image:auth.info.image)
    end
    user
  end
end
