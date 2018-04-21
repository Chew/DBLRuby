# Stats and stuff, ya know.
class DBLRuby::Stats
  # Initialize the stats
  # Program does this automatically when running DBLRuby.new.
  def initialize(apikey, id)
    @api = apikey
    @id = id
  end

  # Get the server count, returns an int.
  def getservercount
    url = "https://discordbots.org/api/bots/#{@id}"
    JSON.parse(RestClient.get(url))['server_count'].to_i
  end
end
