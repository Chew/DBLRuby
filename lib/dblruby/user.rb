# Find information about users.
class DBLRuby::User
  # Initialize the user
  # @param id [Integer, String] Integer/String ID of user you're requesting.
  def initialize(id)
    url = "https://discordbots.org/api/users/#{id}"
    @data = JSON.parse(RestClient.get(url))
  rescue RestClient::NotFound
    raise DBLRuby::Errors::InvalidUser,
          'The API returned a 404 error! Does that user exist?'
  end

  # @return data in raw json form.
  attr_reader :data

  alias to_s data

  # Return the error if there is one, nil otherwise.
  # @return [String, nil] the error.
  def error
    @data['error']
  end

  # Get the user's ID.
  # @return [Integer] User ID in integer form.
  def id
    @data['id'].to_i
  end

  # Get the user's username.
  # @return [String] the user's username.
  def username
    @data['username']
  end

  # Get the user's discriminator.
  # @return [Integer] the user's discriminator without the #.
  def discriminator
    @data['discriminator'].delete('#').to_i
  end

  alias discrim discriminator
  alias tag discriminator

  # Returns the user's distinct, which is the Username and Discriminator.
  # @return [String] the user's username + discrim.
  def distinct
    "#{username}\##{tag}"
  end

  # Get the user's def avatar.
  # @return [String] the user's defAvatar.
  def defavatar
    @data['defAvatar']
  end

  # Get the user's avatar.
  # @return [String] the user's avatar hash.
  def avatar
    @data['avatar']
  end

  # Get's the user's avatar as an img, ready to be used in image linking.
  # @return [String] the user's avatar link.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # Get the user's bio.
  # @return [String] the user's bio.
  def bio
    @data['bio']
  end

  # Get a list of social links for the user
  # @return [Array<String>] the user's social links.
  def social
    @data['social']
  end

  # Does the user have any social links? True if so, false if not.
  # @return [true, false] if the user has any social links.
  def social?
    !@data['social'].nil?
  end

  # Get the user's YouTube channel link.
  # @return [String] the user's youtube channel link.
  def youtube
    @data['social']['youtube']
  end

  # Get the user's Reddit link.
  # @return [String] the user's reddit link.
  def reddit
    @data['social']['reddit']
  end

  # Get the user's Twitter link.
  # @return [String] the user's twitter link.
  def twitter
    @data['social']['twitter']
  end

  # Get the user's Instagram link.
  # @return [String] the user's instagram link.
  def instagram
    @data['social']['instagram']
  end

  # Get the user's Github link.
  # @return [String] the user's github link.
  def github
    @data['social']['github']
  end

  # Get the user's Hex Colour.
  # @return [String] the user's hex code for their page.
  def color
    @data['color']
  end

  alias colour color

  # Get the user's supporter status.
  # @return [true, false] the user's supporter status.
  def supporter?
    @data['supporter']
  end

  alias supporter supporter?

  # Get the user's certified developer status.
  # @return [true, false] the user's certified status.
  def certified?
    @data['lib']
  end

  alias certified certified?
  alias certifieddev certified
  alias certifieddev? certified

  # Get the user's mod status.
  # @return [true, false] the user's mod status.
  def mod?
    @data['mod']
  end

  alias mod mod?

  # Get the user's website moderator status.
  # @return [true, false] the user's website mod status.
  def webmod?
    @data['webMod']
  end

  alias webmod webmod?

  # Get the user's admin status.
  # @return [true, false] the user's admin status.
  def admin?
    @data['admin']
  end

  alias admin admin?

  # Debug method to force a bot error.
  def fail
    raise DBLRuby::Errors::NoData, 'The API didn\'t return anything!'
  end
end
