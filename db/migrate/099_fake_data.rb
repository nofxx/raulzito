class FakeData < ActiveRecord::Migration
  def self.up
    User.create!(:login => "admin", :password => "admin", :name => "admin", :kind => :admin,
                 :password_confirmation => "admin", :state => :active, :locale => "pt",
                 :email => "admin@siga.com", :time_zone => "Brasilia")
  end

  def self.down
  end
end
