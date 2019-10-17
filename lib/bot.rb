require_relative '../config/environment'

module AnswerBot
  class App < SlackRubyBot::Bot

    # command 'word' do |client, data, _match|
    #   # binding.pry
    #   client.web_client.chat_postMessage(channel: data.channel, text: "Today's word is _*#{@@parser.fetch.capitalize}*_")
    # end

    # command 'def' do |client, data, _match|
    #   @@parser.definition.each do |c|
    #     client.web_client.chat_postMessage(channel: data.channel, text: "_#{c}_")
    #   end
    # end

    # match /.*\bword\b.*$/i do |client, data, _match|
    #   @@parser.fetch
    #   search_link = @@parser.search()
    #   client.say(channel: data.channel, text: "Today's word is _*#{@@parser.todays_word.capitalize}*_")
    #   @@parser.definition.each do |c|
    #     client.say(channel: data.channel, text: "_#{c}_")
    #   end
    # end
    
    scan(/([a-zA-Z0-9]*)/) do |client, data, input|
      # keywords.each do |search|
      #   begin
          # search_link = @@parser.search(keywords)
          input = data.text
          keyword_list = {
            ["user guide","guide"] => "https://user-guide.cloud-platform.service.justice.gov.uk/|user-guide.cloud-platform.service.justice.gov.uk",
            ["permission denied", "logged out"] => "https://user-guide.cloud-platform.service.justice.gov.uk/|user-guide.cloud-platform.service.justice.gov.uk"
          }
    
          keyword_list.each do |list, href|
            list.each do |keyword|
              if input.include?(keyword)
                puts "Keyword match #{keyword}"
                client.say(channel: data.channel, text: "Is this what you want #{href}")
              end
            end
          end

    end


    # match /.*\b(guide)\b.*$/i do |client, data, _match|
    #   # sayings = ["What's up, fool?", "You already know what tf is goin' on", "Yo, I'm feeling sassy",
    #   #   "Weird flex but aight", "👋"]
    #   sayings = ["This is our user guide: <https://user-guide.cloud-platform.service.justice.gov.uk/|user-guide.cloud-platform.service.justice.gov.uk>"]

    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # match /.*\b(namespace resource limits|limit|limits)\b.*$/i do |client, data, _match|
    #   sayings = ["Here is our <https://user-guide.cloud-platform.service.justice.gov.uk/concepts.html#namespace-container-resource-limits|Namespace/Container Resource Limits> in user guide"]
    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # match /.*\b(namespace resource limits|limit|limits)\b.*$/i do |client, data, _match|
    #   sayings = ["Here is our guide on <https://user-guide.cloud-platform.service.justice.gov.uk/concepts.html#namespace-container-resource-limits|Namespace/Container Resource Limits>"]
    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # match /.*\b(template deploy)\b.*$/i do |client, data, _match|
    #   sayings = ["Here is our guide on <https://user-guide.cloud-platform.service.justice.gov.uk/concepts.html#namespace-container-resource-limits|Namespace/Container Resource Limits>"]
    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # match /.*\b(kubectl)\b.*$/i do |client, data, _match|
    #   sayings = ["Here is our guide on <https://user-guide.cloud-platform.service.justice.gov.uk/tasks.html#how-to-use-kubectl-to-connect-to-the-cluster|How to use kubectl to connect to the cluster>"]
    #   client.say(channel: data.channel, text: sayings.sample)
    # end
 

    # match /.*\b(thank you|thanks)\b.*$/i do |client, data, _match|
    #   sayings = ["🙏", "👊"]

    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # match 'ping' do |client, data, _match|
    #   client.say(channel: data.channel, text: 'pong 🏓')
    # end

    # operator '=' do |client, data, match|
    #   sayings = ["🙏", "👊"]
    #   client.say(channel: data.channel, text: sayings.sample)
    # end

    # scan(/([a-zA-Z0-9]*)/) do |client, data, keywords|
    #   keywords.each do |keyword|
    #     begin
    #       @@parser.fetch
    #       puts "keyword=#{keyword}"
    #       search_link = @@parser.search(keyword)
    #       client.say(channel: data.channel, text: "Today's word is _*#{@@parser.todays_word.capitalize}*_")

    #     # rescue IEX::Errors::SymbolNotFoundError
    #     #   logger.warn "no results found for keyword #{keyword}"
    #     end
    #   end
    # end
  end

  class Default < SlackRubyBot::Commands::Base
    match /^(?<bot>\w*)$/

    def self.call(client, data, _match)
      client.say(channel: data.channel, text: "Uhhh")
    end
  end
end
