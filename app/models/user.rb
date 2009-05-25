class User < ActiveRecord::Base
  belongs_to :playing_as, :class_name => "Player", :foreign_key => "playing_as"
   has_many  :gameplays
  has_many  :matches, :through => :gameplays

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
