class User < ActiveRecord::Base
  belongs_to :playing_as, :class_name => "Player", :foreign_key => "playing_as"
  has_many  :gameplays
  has_many  :matches, :through => :gameplays
  has_many  :friendships
  has_many  :friends, :through => :friendships
  # has_attached_file :photo,
    #                 :styles => { :normal => '40x40#' },
    #                 :whiny_thumbnails => true,
    #                 :default_style => :normal,
    #                 :default_url => "bigicons/avatar.png",
    #                 :path => ":rails_root/public/files/user/photos/:style_:id.:extension",
    #                 :url => "/files/user/photos/:style_:id.:extension"

 acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.logged_in_timeout = 30.minutes
  #  c.login_field_validates_length_of_options = { :within => 3..30 }
   # c.login_field_validates_format_of_options = { :message => I18n.t('authlogic.validates.format_login_field') }
   # c.login_field_validates_uniqueness_of_options = { :allow_blank => false }
  end

end

# == Schema Information
# Schema version: 20090525081807
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  login               :string(30)      not null
#  kind                :string(20)      not null
#  email               :string(100)
#  name                :string(100)
#  state               :string(255)     default("passive"), not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  time_zone           :string(50)      not null
#  locale              :string(50)      not null
#  last_login_at       :datetime
#  last_request_at     :datetime
#  current_login_at    :datetime
#  login_count         :integer
#  rating              :integer
#  wins                :integer
#  loses               :integer
#  fics_rating         :integer
#  fics_login          :string(255)
#  fics_password       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

