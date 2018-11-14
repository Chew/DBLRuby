# A search for the bots
class DBLRuby::Search
  # Start a new search
  # @param limit [Integer] The amount of bots to return. Max. 500
  # @param offset [Integer] Amount of bots to skip
  # @param search [String] A search string in the format of field: value field2: value2
  # @param sort [String] The field to sort by. Prefix with - to reverse the order
  # @param fields [String] A comma separated list of fields to show.
  def initialize(search: nil, limit: 50, offset: 0, sort: nil, fields: nil)
    url = 'https://discordbots.org/api/bots'
    @search = search
    @limit = limit
    @offset = offset
    @sort = sort
    @fields = fields
    @data = JSON.parse(RestClient.get(url, params: { search: search,
                                                     limit: limit,
                                                     offset: offset,
                                                     sort: sort,
                                                     fields: fields }))
  end

  # @return data in raw json form.
  attr_reader :data

  alias_method :to_s, :data

  # @return [String] the search query
  attr_reader :search

  # @return [Integer] the limit query
  attr_reader :limit

  # @return [Integer] the offset query
  attr_reader :offset

  # @return [String] the sort query
  attr_reader :sort

  # @return [String] the fields query
  attr_reader :fields

  # The amount of results returned
  # @return [String] The amount of bots
  # @see #count
  def size
    @data['results'].length
  end

  # Gets all the bots
  # @return [Array<Bot>] a list of the bots
  def results
    output = Array.new(size)
    cur = 0
    @data['results'].each do |e|
      output[cur] = DBLRuby::Bot.new(data: e)
      cur += 1
    end
    output
  end

  # Return only the first bot
  # @return [Bot] the first bot.
  def first
    DBLRuby::Bot.new(data: @data['results'][0])
  end

  # Get the next page
  # @return [Search] next page of results
  def next
    DBLRuby::Search.new(
      search: search,
      limit: limit,
      offset: limit + offset,
      sort: sort,
      fields: fields
    )
  end

  # Get the bot count in this result
  # @return [Integer] total bots returned
  # @see #size
  def count
    @data['count']
  end

  # Get the total possible amount of bots there are for this query
  # @return [Integer] the total amount of bots
  def total
    @data['total']
  end
end
