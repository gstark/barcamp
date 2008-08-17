class Talk < ActiveRecord::Base
  belongs_to :room
  
  named_scope :by_time,   :order => :start_time
  named_scope :morning,   :conditions => [ "start_time <  '2000-01-01 12:00' " ]
  named_scope :afternoon, :conditions => [ "start_time >= '2000-01-01 12:00' " ]
end
