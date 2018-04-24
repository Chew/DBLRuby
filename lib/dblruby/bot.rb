# Find information about bots.
class DBLRuby::Bot
  # Initialize the bot
  # @param id [Integer, String] Integer/String ID of bot you're requesting.
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

  # Get the bot's invite link.
  # @return [String] the bot's invite link.
  def invite
    @data['invite']
  end

  # Get the bot's GitHub Repo link.
  # @return [String] the bot's GitHub Repo link.
  def github
    @data['github']
  end

  # Get the bot's website link.
  # @return [String] the bot's website link.
  def website
    @data['website']
  end

  # Get the bot's Long Description.
  # @return [String] the bot's Long Description.
  def longdesc
    @data['longdesc']
  end

  # Get the bot's Short Description.
  # @return [String] the bot's Short Description.
  def shortdesc
    @data['shortdesc']
  end

  # Get the bot's prefix.
  # @return [String] the bot's prefix.
  def prefix
    @data['prefix']
  end

  # Get the bot's library.
  # @return [String] the bot's library.
  def lib
    @data['lib']
  end

  # Get the bot's Client ID.
  # @return [Integer] the bot's client id.
  def clientid
    @data['clientid'].to_i
  end

  # Get the bot's avatar.
  # @return [String] the bot's avatar.
  def avatar
    @data['avatar']
  end

  # Get's the bot's avatar as an img, ready to be used in image linking.
  # @return [String] the bot's avatar image url.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # Get the bot's ID.
  # @return [Integer] the bot's id.
  def id
    @data['id'].to_i
  end

  # Get the bot's discriminator.
  # @return [Integer] the bot's discriminator without the #.
  def discriminator
    @data['discriminator'].delete('#').to_i
  end

  alias discrim discriminator
  alias tag discriminator

  # Get the bot's username.
  # @return [String] the bot's username.
  def username
    @data['username']
  end

  # Returns the bot's distinct, which is the Username and Discriminator.
  # @return [String] the bot's distinct.
  def distinct
    "#{username}\##{tag}"
  end

  # Get the bot's creation date (on the list).
  # @return [String] the bot's date.
  def date
    @data['date']
  end

  # Get the bot's support server invite code.
  # @return [String] the bot's support server code.
  def support
    @data['support']
  end

  # Get the bot's support server link, ready for clicking.
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

  # Get the bot's monthly votes.
  # @return [Integer] the bot's monthly points/votes.
  def monthlypoints
    @data['monthlyPoints'].to_i
  end

  alias monthlyvotes monthlypoints

  # Get the bot's total votes.
  # @return [Integer] the bot's total points/votes.
  def points
    @data['points'].to_i
  end

  alias votes points

  # Get the bot's certified status.
  # @return [true, false] the bot's certified status.
  def certifiedbot
    @data['certifiedBot']
  end

  alias certified? certifiedbot
  alias certified certifiedbot
  alias certifiedbot? certifiedbot

  # Get the bot's owners.
  # @return [Array<String>] the bot's owners in an array.
  def owners
    @data['owners']
  end

  # Get the bot's sorting tags.
  # @return [Array<String>] the bot's tags in an array.
  def tags
    @data['tags']
  end

  # Get the bot's legacy status.
  # @return [true, false] the bot's legacy status.
  def legacy
    @data['legacy']
  end

  alias legacy? legacy

  # Debug method to force a bot error.
  def fail
    raise DBLRuby::Errors::NoData, 'The API didn\'t return anything!'
  end
end
