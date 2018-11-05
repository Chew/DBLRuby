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
  # @raise [DBLRuby::Errors::InvalidID] if the DBL returns a 404 error.
  def servercount
    url = "https://discordbots.org/api/bots/#{@id}"
    JSON.parse(RestClient.get(url))['server_count'].to_i
  rescue RestClient::NotFound
    raise DBLRuby::Errors::InvalidID,
          'DBL Returned a 404 unknown error! Did you enter the correct ID?'
  end

  alias servers servercount

  # Update the bot's server count.
  # @param count [Integer, Array<Integer>] Integer/String of bot server count.
  # @param shard_id [Integer] ID of the shard
  # @param shard_count [Integer] amount of shards the bot has.
  # @raise [DBLRuby::Errors::InvalidAPIKey] if the DBL returns a 401 error.
  # @return The count of the servers.
  def updateservercount(count, shard_id = nil, shard_count = nil)
    url = "https://discordbots.org/api/bots/#{@id}/stats"
    json = {
      'server_count': count,
      'shard_id': shard_id,
      'shard_count': shard_count
    }
    RestClient.post(url, json, Authorization: @api, 'Content-Type': :json)
    count
  rescue RestClient::Unauthorized
    raise DBLRuby::Errors::InvalidAPIKey,
          'There was an error posting stats to the DBL. Is your API key ok?'
  end

  alias servers= updateservercount

  # Check to see if a user really voted, via an ID.
  # @param id [Integer, String] Integer/String ID of user you're requesting.
  # @return [true, false] if the user voted or not.
  # @raise [DBLRuby::Errors::InvalidAPIKey] if the DBL returns a 401 error.
  def verifyvote(id)
    r = RestClient.get('https://discordbots.org/api/bots/check',
                       params: { userId: id },
                       Authorization: @api,
                       'Content-Type': :json)
    o = JSON.parse(r)['voted'].to_i
    !o.zero?
  rescue RestClient::Unauthorized
    raise DBLRuby::Errors::InvalidAPIKey,
          'There was an error posting stats to the DBL. Is your API key ok?'
  end
end
