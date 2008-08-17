module ScheduleHelper
  def talk_time( talk )
    start_time = talk.start_time.strftime( "%H:%M" ) rescue "????"
    end_time   = talk.end_time.strftime( "%H:%M" ) rescue "????"
    "#{start_time} - #{end_time}"
  end
end
