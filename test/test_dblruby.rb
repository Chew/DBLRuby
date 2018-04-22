require 'minitest/autorun'
require 'dblruby'

# We require rest-client so we can manually get the data from the API ourselves.
# Then we compare it to what the gem gives us.
require 'rest-client'

class DBLRubyTest < Minitest::Test
  def test_chew_bio
    dbl = DBLRuby.new('api', 'id')
    id = 116_013_677_060_161_545
    user = dbl.loaduser(id)
    url = "https://discordbots.org/api/users/#{id}"
    bio = JSON.parse(RestClient.get(url))['bio']
    assert_equal bio,
                 user.bio
  end

  def test_chewbotcca_servercount
    dbl = DBLRuby.new('api', 'id')
    id = 200_052_560_399_171_584
    bot = dbl.loadbot(id)
    url = "https://discordbots.org/api/bots/#{id}"
    server = JSON.parse(RestClient.get(url))['server_count']
    assert_equal server,
                 bot.server
  end
end
