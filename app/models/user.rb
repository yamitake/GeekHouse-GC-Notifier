#coding: UTF-8
class User < ActiveRecord::Base
  rolify
  has_many :members
  accepts_nested_attributes_for :members, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  has_many :tweets
  accepts_nested_attributes_for :tweets,  reject_if: proc { |attributes| attributes['message'].blank? }, allow_destroy: true
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :password, :uid, :provider, :image,
                  :house_name, :members_attributes, :tweets_attributes,
                  :access_token, :access_secret

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.info.nickname,
                         provider:auth.provider,
                         access_token:auth.credentials.token,
                         access_secret:auth.credentials.secret,
                         uid:auth.uid,
                         password:Devise.friendly_token[0,20],
                         image:auth.info.image)
    end
    user
  end
  before_update do
    self.house_name ||= "名無しさん"
  end
end
