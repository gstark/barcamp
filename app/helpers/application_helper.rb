# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def talk_url( talk )
    link_to( talk.url, talk.url, { :target => "_blank" } ) if talk.url
  end
  
  def text_sponsor_name( sponsors, sponsor )
    longest_sponsor_name = sponsors.sort_by { |s| s.name.length }.last

    sponsor.name.ljust( longest_sponsor_name.name.length + 2," ")
  end

  def text_talk_description( talk, padding, width)
    wrap_text( talk.description, width ).gsub( "\n", "\n" + padding)
  end

  # From: http://blog.macromates.com/2006/wrapping-text-with-regular-expressions/
  def wrap_text(text, col = 80)
    text.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,"\\1\\3\n") 
  end

end
