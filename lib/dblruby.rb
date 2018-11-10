# Require external gems
require 'json'
require 'rest-client'

# All DBLRuby functionality, whether extended or just here.
class DBLRuby
  # Initialize a new DBL API, via a key.
  # @param apikey [String] API Key of the bot, taken from the DBL.
  # @param id [Integer, String] Integer/String of the bot's id.
  def initialize(apikey, id)
    @api = apikey
    @id = id
  end

  # Initialize stats
  def stats
    Stats.new(@api, @id)
  end

  # Load a bot.
  # @param id [Integer, String] Integer/String ID of the bot you're requesting.
  def bot(id)
    Bot.new(id)
  end

  alias loadbot bot

  # Get all of the bot's stats as if you just called DBL.bot(id)
  # @return [Bot] the bot as a bot.
  def self
    bot(@id)
  end

  # Load a user
  # @param id [Integer, String] Integer/String ID of the user you're requesting.
  def user(id)
    User.new(id)
  end

  alias loaduser user

  # Change the API key
  # @param apikey [String] API Key of the bot, taken from the DBL.
  attr_writer :api

  alias updateapikey api=
  alias updateapi api=
  alias apikey= api=

  # Change the bot ID
  # @param id [Integer, String] Integer/String of the bot's id.
  attr_writer :id

  # Define voting
  def voting
    Voting.new
  end

  alias updateid id=

  # Get the ID from instantiation
  attr_reader :id

  # Get the API Key from instantiation
  attr_reader :api

  alias apikey api
end

# Require files.
require 'dblruby/bot'
require 'dblruby/errors'
require 'dblruby/user'
require 'dblruby/stats'
require 'dblruby/voting'
