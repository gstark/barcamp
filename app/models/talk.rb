class Talk < ActiveRecord::Base
  belongs_to :room
  
  named_scope :by_time,   :order => "time(start_time)"
  named_scope :morning,   :conditions => [ "time(start_time) <  '12:00' " ]
  named_scope :afternoon, :conditions => [ "time(start_time) >= '12:00' " ]

  # Find the current and next talk
  named_scope :active,    lambda { |*args| named_scope_active( *args ) }
  named_scope :next,      lambda { |*args| named_scope_next( *args ) }

  validates_presence_of :name, :room_id, :start_time, :end_time
  validate :timecheck

  def timecheck
    min = Date.new(2000,1,1)
    if start_time && end_time
      errors.add_to_base("Please set times") if start_time == min || end_time == min
      errors.add_to_base("Please set end time after start time") if end_time <= start_time
    end
  end

  def speakable_description
    "#{name}, by #{who}. . . From #{start_time_string} until #{end_time_string}"
  end
 
  def start_time_string
    start_time ? start_time.strftime("%I:%M") : "unknown"
  end

  def end_time_string
    end_time ? end_time.strftime("%I:%M") : "unknown"
  end

  private
    def self.named_scope_active( *args )
      time = args.first || Time.now
      { :conditions => [ "time(start_time) <= time(?) and time(end_time) >= time(?)", time, time ] }
    end
    
    def self.named_scope_next( *args )
      time = args.first || Time.now
      { :conditions => [ "time(start_time) >= time(?)", time ], :order => "start_time", :limit => 1 }
    end
end
