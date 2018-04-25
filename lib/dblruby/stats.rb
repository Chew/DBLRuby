# Stats and stuff, ya know.
class DBLRuby::Stats
  # Initialize the stats
  # Program does this automatically when running DBLRuby.new.
  def initialize(apikey, id)
    @api = apikey
    @id = id
  end

  # Get the bot's server count, returns an int.
  # @return [Integer] amount of servers the bot is on.
  def servercount
    url = "https://discordbots.org/api/bots/#{@id}"
    JSON.parse(RestClient.get(url))['server_count'].to_i
  end

  alias servers servercount

  # Update the bot's server count.
  # @param id [Integer, String] Integer/String ID of bot server count.
  def updateservercount(count)
    url = "https://discordbots.org/api/bots/#{@id}/stats"
    json = '{"server_count":' + count.to_s + '}'
    RestClient.post(url, json, :Authorization => @api, :'Content-Type' => :json)
    "Successfully set the server count to #{count}"
  rescue RestClient::Unauthorized
    raise DBLRuby::Errors::InvalidAPIKey,
          'There was an error posting stats to the DBL. Is your API key ok?'
  end

  alias servers= updateservercount

  # Check to see if a user really voted, via an ID.
  # @param id [Integer, String] Integer/String ID of user you're requesting.
  # @return [true, false] if the user voted or not.
  def verifyvote(id)
    r = RestClient.get('https://discordbots.org/api/bots/check',
                       params: { userId: id },
                       :Authorization => @api,
                       :'Content-Type' => :json)
    o = JSON.parse(r)['voted'].to_i
    !o.zero?
  rescue RestClient::Unauthorized
    raise DBLRuby::Errors::InvalidAPIKey,
          'There was an error posting stats to the DBL. Is your API key ok?'
  end
end
