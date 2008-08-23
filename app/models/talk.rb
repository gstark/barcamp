class Talk < ActiveRecord::Base
  belongs_to :room
  
  named_scope :by_time,   :order => :start_time
  named_scope :morning,   :conditions => [ "start_time <  '2000-01-01 12:00' " ]
  named_scope :afternoon, :conditions => [ "start_time >= '2000-01-01 12:00' " ]
  
  validates_presence_of :name, :room_id, :start_time, :end_time
  validate :timecheck
  
  def timecheck
    min = Date.new(2000,1,1)
    if start_time && end_time
      errors.add_to_base("Please set times") if start_time == min || end_time == min
      errors.add_to_base("Please set end time after start time") if end_time <= start_time
    end
  end
  
  #returns string array of time slots in 15 minute increments starting at 9AM and ending at 4:45PM
  def self.timeslots
    slots = ["----"]
    (9..16).each do |hour|
      (0..3).each do |min|
        slots << "#{hour}:" + "#{min * 15}".ljust(2,"0")
      end
    end
    slots
  end
  
end
