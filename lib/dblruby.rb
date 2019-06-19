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
  # @return [Stats] the new stats object
  def stats
    Stats.new(@api, @id)
  end

  # Load a bot.
  # @param id [Integer, String] Integer/String ID of the bot you're requesting.
  # @return [Bot] the new Bot object
  def bot(id)
    Bot.new(id: id, api: @api)
  end

  alias_method :loadbot, :bot

  # Get all of the bot's stats as if you just called DBL.bot(id)
  # @return [Bot] the bot as a bot.
  def self
    bot(@id)
  end

  # Load a user
  # @param id [Integer, String] Integer/String ID of the user you're requesting.
  # @return [User] the new user object
  def user(id)
    User.new(id, api)
  end

  alias_method :loaduser, :user

  # Change the API key
  attr_writer :api

  alias_method :updateapikey, :api=
  alias_method :updateapi, :api=
  alias_method :apikey=, :api=

  # Change the bot ID
  attr_writer :id

  alias_method :updateid, :id=

  # Define weekend
  # @return [Weekend] the new Weekend object
  def weekend
    Weekend.new
  end

  # Returns true or false depending on if it's the "weekend"
  # Weekend counts as 2 votes instead of one.
  # @return [true, false] whether it's the weekend or not
  def weekend?
    weekend.weekend?
  end

  # Start a search
  # @return [Search] the new search object
  # @see Search#initialize
  def search(search: nil, limit: 50, offset: 0, sort: nil, fields: nil)
    Search.new(search: search, limit: limit, offset: offset, sort: sort, fields: fields)
  end

  # @see Widget#initialize
  def widget(size: 'large', file_type: 'png', small_type: nil, topcolor: nil, middlecolor: nil, usernamecolor: nil, certifiedcolor: nil, datacolor: nil, labelcolor: nil, highlightcolor: nil, avatarbg: nil, leftcolor: nil, rightcolor: nil, lefttextcolor: nil, righttextcolor: nil, id: @id)
    Widget.new(size: size, file_type: file_type, small_type: small_type, topcolor: topcolor, middlecolor: middlecolor, usernamecolor: usernamecolor, certifiedcolor: certifiedcolor, datacolor: datacolor, labelcolor: labelcolor, highlightcolor: highlightcolor, avatarbg: avatarbg, leftcolor: leftcolor, rightcolor: rightcolor, lefttextcolor: lefttextcolor, righttextcolor: righttextcolor, id: id)
  end

  # Get the ID from instantiation
  attr_reader :id

  # Get the API Key from instantiation
  attr_reader :api

  alias_method :apikey, :api
end

# Require files.
require 'dblruby/bot'
require 'dblruby/errors'
require 'dblruby/user'
require 'dblruby/search'
require 'dblruby/stats'
require 'dblruby/weekend'
require 'dblruby/widget'
