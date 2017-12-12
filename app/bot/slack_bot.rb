require 'bittrex'

module Bot
  class SlackBot < SlackRubyBot::Bot

    match /^[^\-]*/ do |client, data, match|
      up_match = data.text.upcase
      if MARKETS.include?(up_match)
        response = Bittrex::Quote.current(up_match)
        result = "*1* (#{up_match.split('-')[1]}) is *#{response.last}* (#{up_match.split('-')[0]})"
        client.say(channel: data.channel, text: result)
      else
        if(data.text.include?('-'))
          client.say(channel: data.channel, text: 'Not Found')
        end
      end
    end

  end
end

