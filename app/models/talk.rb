class Talk < ActiveRecord::Base
  belongs_to :room
  
  named_scope :by_time,   :order => :start_time
  named_scope :morning,   :conditions => [ "time(start_time) <  '12:00' " ]
  named_scope :afternoon, :conditions => [ "time(start_time) >= '12:00' " ]
  
  validates_presence_of :name, :room_id, :start_time, :end_time
  validate :timecheck
  
  def timecheck
    min = Date.new(2000,1,1)
    if start_time && end_time
      errors.add_to_base("Please set times") if start_time == min || end_time == min
      errors.add_to_base("Please set end time after start time") if end_time <= start_time
    end
  end
   
end
