require 'yahoo_weatherman'

client = Weatherman::Client.new 

puts "Type your zip code: "

location = gets.chomp

weather = client.lookup_by_location(location.to_s)

today = Time.now.strftime('%w').to_i


weather.forecasts.each do |forecast|

  day = forecast['date']

  weekday = day.strftime('%w').to_i

  if weekday == today
     dayName = 'Today'
  elsif weekday == today + 1
     dayName = 'Tomorrow'
  else
     dayName = day.strftime('%A')
  end

    puts dayName +  " is going to be "  + forecast["text"].to_s.downcase + " with a low of " + forecast["low"].to_s + " degrees C and a high of " + forecast["high"].to_s + " degrees C."
end