# Errors are cool.
module DBLRuby::Errors
  # Ran if No Data is returned.
  class NoData < RuntimeError; end

  # Ran if a 404 error is returned in #loadbot
  class InvalidBot < RuntimeError; end

  # Ran if a 404 error is returned in #loaduser
  class InvalidUser < RuntimeError; end

  # Ran if a 401 unauthorized error is returned in stats.
  class InvalidAPIKey < RuntimeError; end
end
