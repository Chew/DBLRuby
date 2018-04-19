# All DBLRuby functionality, whether extended or just here.
class DBLRuby
  # Initialize a new DBL API, via a key.
  def initialize(apikey)
    @api = apikey
  end
end

require 'dblruby/stats'
