module ScheduleHelper
  def talk_time( talk )
    start_time = talk.start_time.strftime( "%I:%M" ).gsub(/^0/,"") rescue "????"
    end_time   = talk.end_time.strftime( "%I:%M" ).gsub(/^0/,"") rescue "????"
    "#{start_time} - #{end_time}"
  end
end
