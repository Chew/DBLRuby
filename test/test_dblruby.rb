require 'minitest/autorun'
require 'dblruby'

# We require rest-client so we can manually get the data from the API ourselves.
# Then we compare it to what the gem gives us.
require 'rest-client'

class DBLRubyTest < Minitest::Test
  def test_is_weekend
    api = JSON.parse(RestClient.get('https://top.gg/api/weekend'))['is_weekend']
    code = DBLRuby.new('', 0).weekend?
    assert_equal(api, code)
  end
end
