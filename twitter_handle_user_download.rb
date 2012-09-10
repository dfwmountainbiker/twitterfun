require 'rubygems'
$KCODE = "U"
require 'twitter'


# Configure the Twitter gem with the different API keys
Twitter.configure do |config|
 config.consumer_key = "fLyGngi0zdvmSB64kFY8w"
  config.consumer_secret = "rsl8iOMbZRJKmk3ELTmUfs8YxEBnEyNveVZTzhSz4"
  config.oauth_token = "115757732-FLPv6sTvwy7oYh33S6uR8gxQmPxTreR9APdi94qo"
  config.oauth_token_secret = "vOmev7TDEsJpx81OljxUvXmxdentQRva1R5wEye6ZGE"
end

cursor = -1

puts Twitter.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour"
callsleft = Twitter.rate_limit_status.remaining_hits.to_i

#followerIds = [battlefield]

f = File.open("/czb/battlefield.txt", 'a')

while callsleft > 0 do
puts "The value of cursor is #{cursor}"
  followers = Twitter.follower_ids("battlefield",{:cursor=>cursor})
  cursor = followers.next_cursor
  #followerIds+= followers.ids

   followers.ids.each do |test|
      f.write("#{test}\n")

   end

 callsleft = Twitter.rate_limit_status.remaining_hits.to_i

  sleep(5)
end

f.write ("The value of cursor when leaving is #{cursor}")
f.close

 # Search through the friends list to find a user
#friends.ids.each do |fid|

  #f = Twitter.user(fid)

  # Only iterate if we can see their followers
  #if (f.protected.to_s != "true")
  #  user[f.screen_name.to_s] = f.followers_count
 # end

#end

