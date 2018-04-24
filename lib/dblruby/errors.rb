# Errors are cool.
module DBLRuby::Errors
  # Ran if No Data is returned.
  class NoData < RuntimeError; end

  # Ran if a 404 error is returned in #loadbot
  class InvalidBot < RuntimeError; end
end
