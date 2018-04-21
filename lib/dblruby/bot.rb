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

  # Get the bot's website link.
  def website
    @data['website']
  end

  # Get the bot's Long Description.
  def longdesc
    @data['longdesc']
  end

  # Get the bot's Short Description.
  def shortdesc
    @data['shortdesc']
  end

  # Get the bot's prefix.
  def prefix
    @data['prefix']
  end

  # Get the bot's library.
  def lib
    @data['lib']
  end

  # Get the bot's Client ID.
  def clientid
    @data['clientid']
  end

  # Get the bot's avatar.
  def avatar
    @data['avatar']
  end

  # Get's the bot's avatar as an img, ready to be used in image linking.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # Get the bot's ID.
  def id
    @data['id']
  end

  # Get the bot's discriminator.
  def discriminator
    @data['discriminator']
  end

  alias discrim discriminator
  alias tag discriminator

  # Get the bot's username.
  def username
    @data['username']
  end

  # Get the bot's creation date (on the list).
  def date
    @data['date']
  end

  # Get the bot's support server invite code.
  def support
    @data['support']
  end

  # Get the bot's support server link, ready for clicking.
  def support_link
    "https://discord.gg/#{support}"
  end

  # Get the bot's server count
  def server_count
    @data['server_count']
  end

  alias guild_count server_count
  alias server server_count

  # Get the bot's "This Bot Powers the following Servers"
  def guilds
    @data['guilds']
  end

  alias servers guilds

  # Get the bot's shards.
  def shards
    @data['shards']
  end

  # Get the bot's monthly votes.
  def monthlypoints
    @data['monthlyPoints']
  end

  alias monthlyvotes monthlypoints

  # Get the bot's total votes.
  def points
    @data['points']
  end

  alias votes points

  # Get the bot's certified status.
  def certifiedbot
    @data['certifiedBot']
  end

  alias certified? certifiedbot
  alias certified certifiedbot
  alias certifiedbot? certifiedbot

  # Get the bot's owners.
  def owners
    @data['owners']
  end

  # Get the bot's sorting tags.
  def tags
    @data['tags']
  end

  # Get the bot's legacy status.
  def legacy
    @data['legacy']
  end

  alias legacy? legacy

  # Debug method to force a bot error.
  def fail
    raise DBLRuby::Errors::NoData, 'The API didn\'t return anything!'
  end
end
