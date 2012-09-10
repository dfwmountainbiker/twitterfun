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

counter = 0

  file = File.open("/czb/campusapts.txt", 'r')
       while (line = file.gets) and counter < 2
          puts "#{counter}: #{line}"
        counter = counter + 1
     end


file.close
#exit
 # Search through the friends list to find a user
friends.ids.each do |fid|

  f = Twitter.user(fid)

  # Only iterate if we can see their followers
  if (f.protected.to_s != "true")
    user[f.screen_name.to_s] = f.followers_count
  end
end

