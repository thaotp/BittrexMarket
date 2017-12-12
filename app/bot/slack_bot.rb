require 'bittrex'

ENV['SLACK_API_TOKEN'] = 'xoxb-285433309237-hqZXC1QIOOKUmWli8MHdi6ot'
module Bot
  class SlackBot < SlackRubyBot::Bot
    command 'say' do |client, data, match|

      client.say(channel: data.channel, text: match['expression'])
    end
    match /thao/ do |client, data, match|
      client.say(channel: data.channel, text: "Thảo là anh chàng đẹp trai vô dịch khắp vũ trụ.")
    end

    match /^[^\-]*/ do |client, data, match|
      up_match = data.text.upcase
      if MARKETS.include?(up_match)
        response = Bittrex::Quote.current(up_match)
        result = "*1* (#{up_match.split('-')[1]}) is *#{response.last}* (#{up_match.split('-')[0]})"
        client.say(channel: data.channel, text: result)
      else
        client.say(channel: data.channel, text: 'Not Found')
      end
    end

    # match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
    #   client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
    # end
  end
end

