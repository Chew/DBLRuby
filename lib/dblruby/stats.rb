# Stats and stuff, ya know.
class DBLRuby::Stats
  # Initialize the stats
  # Program does this automatically when running DBLRuby.new.
  def initialize(apikey, id)
    @api = apikey
    @id = id
  end

  # Get the server count, returns an int.
  def servercount
    url = "https://discordbots.org/api/bots/#{@id}"
    JSON.parse(RestClient.get(url))['server_count'].to_i
  end

  # Update the bot's server count.
  def updateservercount(count)
    url = "https://discordbots.org/api/bots/#{@id}/stats"
    json = '{"server_count":' + count.to_s + '}'
    RestClient.post(url, json, :Authorization => @api, :'Content-Type' => :json)
    "Successfully set the server count to #{count}"
  end

  # @return [true, false] if the user voted or not.
  def verifyvote(id)
    r = RestClient.get("https://discordbots.org/api/bots/check?userID=#{id}",
                       params: { userId: id },
                       :Authorization => @api,
                       :'Content-Type' => :json)
    o = JSON.parse(r)['voted'].to_i
    !o.zero?
  end
end
