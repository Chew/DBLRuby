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
    makestats
  end

  # Initialize stats
  def makestats
    @stats = Stats.new(@api, @id)
  end

  # Load a bot.
  # @param id [Integer, String] Integer/String ID of the bot you're requesting.
  def bot(id)
    @bot = Bot.new(id)
  end

  alias loadbot bot

  # Load a user
  # @param id [Integer, String] Integer/String ID of the user you're requesting.
  def user(id)
    @user = User.new(id)
  end

  alias loaduser user

  # Change the API key
  # @param apikey [String] API Key of the bot, taken from the DBL.
  def updateapi(apikey)
    @api = apikey
    makestats
  end

  alias updateapikey updateapi
  alias api= updateapi
  alias apikey= updateapi

  # Change the bot ID
  # @param id [Integer, String] Integer/String of the bot's id.
  def updateid(id)
    @id = id
    makestats
  end

  # Define voting
  def voting
    @voting = Voting.new
  end

  alias id= updateid

  # Get the ID from instantiation
  attr_reader :id

  # Get the API Key from instantiation
  attr_reader :api

  alias apikey api

  attr_reader :stats
end

# Require files.
require 'dblruby/bot'
require 'dblruby/errors'
require 'dblruby/user'
require 'dblruby/stats'
require 'dblruby/voting'
