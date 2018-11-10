# Find information about bots.
class DBLRuby::Bot
  # Initialize the bot
  # @param id [Integer, String] Integer/String ID of bot you're requesting.
  # @raise [DBLRuby::Errors::InvalidBot] if the DBL returns a 404 error.
  def initialize(id)
    url = "https://discordbots.org/api/bots/#{id}"
    @data = JSON.parse(RestClient.get(url))
  rescue RestClient::NotFound
    raise DBLRuby::Errors::InvalidBot,
          'The API returned a 404 error! Is that bot listed?'
  end

  # @return data in raw json form.
  attr_reader :data

  alias to_s data

  # Return the error if there is one, nil otherwise.
  # @return [String, nil] the error.
  def error
    @data['error']
  end

  # Return true if there is an error, false otherwise.
  # @return [true, false] if there is an error.
  def error?
    !@data['error'].nil?
  end

  # The custom bot invite url of the bot.
  # @return [String] the bot's invite link.
  def invite
    @data['invite']
  end

  # The link to the github repo of the bot.
  # @return [String] the bot's GitHub Repo link.
  def github
    @data['github']
  end

  # The website url of the bot.
  # @return [String] the bot's website link.
  def website
    @data['website']
  end

  # The long description of the bot. Can contain HTML and/or Markdown.
  # @return [String] the bot's Long Description.
  def longdesc
    @data['longdesc']
  end

  # The short description of the bot.
  # @return [String] the bot's Short Description.
  def shortdesc
    @data['shortdesc']
  end

  # The prefix of the bot.
  # @return [String] the bot's prefix.
  def prefix
    @data['prefix']
  end

  # The library of the bot.
  # @return [String] the bot's library.
  def lib
    @data['lib']
  end

  # Get the bot's Client ID.
  # @return [Integer] the bot's client id.
  def clientid
    @data['clientid'].to_i
  end

  # The cdn hash of the bot's avatar if the bot has none.
  # @return [String] the bot's defAvatar.
  def defavatar
    @data['defAvatar']
  end

  # The avatar hash of the bot's avatar.
  # @return [String] the bot's avatar.
  def avatar
    @data['avatar']
  end

  # Get's the bot's avatar as an img, ready to be used in image linking.
  # @return [String] the bot's avatar image url.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # The id of the bot.
  # @return [Integer] the bot's id.
  def id
    @data['id'].to_i
  end

  # The discriminator of the bot.
  # @return [Integer] the bot's discriminator without the #.
  def discriminator
    @data['discriminator'].delete('#').to_i
  end

  alias discrim discriminator
  alias tag discriminator

  # The username of the bot.
  # @return [String] the bot's username.
  def username
    @data['username']
  end

  # Returns the bot's distinct, which is the Username and Discriminator.
  # @return [String] the bot's distinct.
  def distinct
    "#{username}\##{tag}"
  end

  # The date when the bot was approved.
  # @return [Date] the bot's approval date.
  def date
    Date.parse(@data['date'])
  end

  # The time when the bot was approved.
  # This is compatiable with embed.timestamp, unlike #date
  # @return [Time] the bot's approval time.
  def time
    Time.parse(@data['date'])
  end

  # The support server invite code of the bot.
  # @return [String] the bot's support server code.
  def support
    @data['support']
  end

  # The bot's support server link, ready for clicking.
  # @return [String] the bot's support server link.
  def support_link
    "https://discord.gg/#{support}"
  end

  # Get the bot's server count
  # @return [Integer] the bot's server count.
  def server_count
    @data['server_count'].to_i
  end

  alias guild_count server_count
  alias server server_count

  # Get the bot's "This Bot Powers the following Servers"
  # @return [Array<String>] the bot's guilds.
  def guilds
    @data['guilds']
  end

  alias servers guilds

  # Get the bot's shards.
  # @return [Array<String>] the bot's shards.
  def shards
    @data['shards']
  end

  # The amount of upvotes the bot has this month.
  # @return [Integer] the bot's monthly points/votes.
  def monthlypoints
    @data['monthlyPoints'].to_i
  end

  alias monthlyvotes monthlypoints

  # The amount of upvotes the bot has.
  # @return [Integer] the bot's total points/votes.
  def points
    @data['points'].to_i
  end

  alias votes points

  # The certified status of the bot.
  # @return [true, false] the bot's certified status.
  def certified?
    @data['certifiedBot']
  end

  alias certifiedbot certified?
  alias certified certified?
  alias certifiedbot? certified?

  # The owners of the bot. First one in the array is the main owner.
  # @return [Array<String>] the bot's owners in an array.
  def owners
    @data['owners']
  end

  # The tags of the bot.
  # @return [Array<String>] the bot's tags in an array.
  def tags
    @data['tags']
  end

  # The vanity url of the bot.
  # @return [String] the bot's vanity url.
  def vanity
    @data['vanity']
  end

  # Get the bot's legacy status.
  # @return [true, false] the bot's legacy status.
  def legacy
    @data['legacy']
  end

  alias legacy? legacy
end
