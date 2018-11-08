# Find information about users.
class DBLRuby::Voting
  # Initialize the voting
  def initialize
    url = 'https://discordbots.org/api/weekend'
    @data = JSON.parse(RestClient.get(url))
  end

  # @return data in raw json form.
  attr_reader :data

  alias to_s data

  # Return the error if there is one, nil otherwise.
  # @return [String, nil] the error.
  def weekend?
    @data['is_weekend']
  end

  alias isweekend weekend?
end
