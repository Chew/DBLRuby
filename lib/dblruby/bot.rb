# Find information about bots.
class DBLRuby::Bot
  # Initialize the bot
  # @param id [Integer, String] Integer/String ID of bot you're requesting.
  def initialize(id)
    url = "https://discordbots.org/api/bots/#{id}"
    @data = JSON.parse(RestClient.get(url))
  end

  # @return data in raw json form.
  attr_reader :data

  # Get the bot's invite link.
  def invite
    @data['invite']
  end

  # Get the bot's GitHub Repo link.
  def github
    @data['github']
  end

  def website
    @data['website']
  end

  def longdesc
    @data['longdesc']
  end

  def shortdesc
    @data['shortdesc']
  end

  def prefix
    @data['prefix']
  end

  def lib
    @data['lib']
  end

  def clientid
    @data['clientid']
  end

  def avatar
    @data['avatar']
  end

  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  def id
    @data['id']
  end

  def discriminator
    @data['discriminator']
  end

  alias discrim discriminator
  alias tag discriminator

  def username
    @data['username']
  end

  def date
    @data['date']
  end

  def support
    @data['support']
  end

  def support_link
    "https://discord.gg/#{support}"
  end

  # Get the bot's server count
  def server_count
    @data['server_count']
  end

  alias guild_count server_count
  alias server server_count

  def guilds
    @data['guilds']
  end

  alias servers guilds

  def shards
    @data['shards']
  end

  def monthlypoints
    @data['monthlyPoints']
  end

  alias monthlyvotes monthlypoints

  def points
    @data['points']
  end

  alias votes points

  def certifiedbot
    @data['certifiedBot']
  end

  alias certified? certifiedbot
  alias certified certifiedbot
  alias certifiedbot? certifiedbot

  def owners
    @data['owners']
  end

  def tags
    @data['tags']
  end

  def legacy
    @data['legacy']
  end

  alias legacy? legacy

  def fail
    raise DBLRuby::Errors::NoData, 'The API didn\'t return anything!'
  end
end
