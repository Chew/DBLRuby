# Errors are cool.
module DBLRuby::Errors
  # Raised if a 404 error is returned in #bot
  class InvalidBot < RuntimeError; end

  # Raised if a 404 error is returned in #user
  class InvalidUser < RuntimeError; end

  # Raised if a 401 unauthorized error is returned in stats.
  class InvalidAPIKey < RuntimeError; end

  # Raised if a 404 unknown error is returned in stats.
  class InvalidID < RuntimeError; end

  # Rasied if an invalid Widget parameter is specified
  class InvalidWidget < RuntimeError; end
end
