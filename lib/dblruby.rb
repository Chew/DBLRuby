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

  attr_reader :stats
end

require 'dblruby/stats'
