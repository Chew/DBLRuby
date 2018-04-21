# Require external gems
require 'json'
require 'rest-client'

# All DBLRuby functionality, whether extended or just here.
class DBLRuby
  # Initialize a new DBL API, via a key.
  def initialize(apikey, id)
    @api = apikey
    @id = id
    makestats
  end

  # Initialize stats
  def makestats
    @stats = Stats.new(@api, @id)
  end

  def loadbot(id)
    @bot = Bot.new(id)
  end

  attr_reader :bot
  attr_reader :stats
end

# Require files.
require 'dblruby/bot'
require 'dblruby/errors'
require 'dblruby/stats'
