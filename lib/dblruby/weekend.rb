# Find information about the weekend.
class DBLRuby::Weekend
  # Initialize the weekend
  # @param data [JSON] the weekend response in JSON form
  def initialize(data)
    @data = data
  end

  # @return data in raw json form.
  attr_reader :data

  alias_method :to_s, :data

  # Return the whether it's the weekend.
  # @return [true, false] the weekend status.
  def weekend?
    @data['is_weekend']
  end

  alias_method :isweekend, :weekend?
end
