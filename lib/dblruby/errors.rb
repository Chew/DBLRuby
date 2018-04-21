# Errors are cool.
module DBLRuby::Errors
  # Ran if No Data is returned.
  class NoData < RuntimeError; end
end
