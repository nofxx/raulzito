class Friend < ActiveRecord::Base
  generator_for :notes => "nice friend"
  generator_for :kind => "admin"
end
