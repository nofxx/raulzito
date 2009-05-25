RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')
require 'digest/md5'

Rails::Initializer.run do |config|
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "haml-edge", :lib => "haml"
  config.gem "authlogic"
  config.gem "thoughtbot-paperclip", :lib => "paperclip"
  config.gem "bcrypt-ruby", :lib => "bcrypt"
  config.gem "nofxx-formtastic", :lib => "formtastic"
  config.gem "will_paginate"
  config.gem "friendly_id"

  # config.action_controller.session = {
  #   :session_key => '_ChessOnRails_session',
  #   :secret      => '0f323b68e4ad062184c40478479bbf96168cf7023719b06f12930b9764e3075616f60c7287e45de9603dcddebef13cc7ca445ab925179bdc0313fdf15314dc94'
  # }
  config.action_controller.session_store = :active_record_store

  # config.active_record.schema_format = :sql
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
  config.time_zone = 'UTC'
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end
