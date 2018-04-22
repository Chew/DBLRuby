# Find information about users.
class DBLRuby::User
  # Initialize the user
  # @param id [Integer, String] Integer/String ID of user you're requesting.
  def initialize(id)
    url = "https://discordbots.org/api/users/#{id}"
    @data = JSON.parse(RestClient.get(url))
  end

  # @return data in raw json form.
  attr_reader :data

  alias to_s data

  # Get the user's ID.
  # @return User ID in integer form.
  def id
    @data['id'].to_i
  end

  # Get the user's username.
  def username
    @data['username']
  end

  # Get the user's discriminator.
  def discriminator
    @data['discriminator']
  end

  alias discrim discriminator
  alias tag discriminator

  # Returns the user's distinct, which is the Username and Discriminator.
  def distinct
    "#{username}#{tag}"
  end

  # Get the user's avatar.
  def avatar
    @data['avatar']
  end

  # Get's the user's avatar as an img, ready to be used in image linking.
  def avatar_img
    "https://cdn.discordapp.com/avatars/#{id}/#{avatar}.webp?size=1024"
  end

  # Get the user's bio.
  def bio
    @data['bio']
  end

  # Get a list of social links for the user
  def social
    @data['social']
  end

  # Does the user have any social links? True if so, false if not.
  def social?
    !@data['social'].nil?
  end

  # Get the user's YouTube channel link.
  def youtube
    @data['social']['youtube']
  end

  # Get the user's Reddit link.
  def reddit
    @data['social']['reddit']
  end

  # Get the user's Twitter link.
  def twitter
    @data['social']['twitter']
  end

  # Get the user's Instagram link.
  def instagram
    @data['social']['instagram']
  end

  # Get the user's Github link.
  def github
    @data['social']['github']
  end

  # Get the user's Hex Colour.
  def color
    @data['color']
  end

  alias colour color

  # Get the user's supporter status.
  def supporter
    @data['supporter']
  end

  alias supporter? supporter

  # Get the user's certified developer status.
  def certified
    @data['lib']
  end

  alias certified? certified
  alias certifieddev certified
  alias certifieddev? certified

  # Get the user's mod status.
  def mod
    @data['mod']
  end

  alias mod? mod

  # Get the user's website moderator status.
  def webmod
    @data['webMod']
  end

  alias webmod? webmod

  # Get the user's admin status.
  def admin
    @data['admin']
  end

  alias admin? admin

  # Debug method to force a bot error.
  def fail
    raise DBLRuby::Errors::NoData, 'The API didn\'t return anything!'
  end
end
