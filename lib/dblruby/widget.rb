# Make a widget
class DBLRuby::Widget
  BASE_URL = 'https://discordbots.org/api/widget/'.freeze

  # Make a new widget
  # @param size ['large', 'small'] The size of the widget.
  # @param file_type ['png', 'svg'] The file type of the image
  # @param small_type ['owner', 'status', 'upvotes', 'servers', 'lib'] The type of small widget.
  # @param topcolor [Hexadecimal] The top color of the widget (Large)
  # @param middlecolor [Hexadecimal] The middle color of the widget (Large)
  # @param usernamecolor [Hexadecimal] The username color of the widget (Large)
  # @param certifiedcolor [Hexadecimal] The certified color of the widget (Large)
  # @param datacolor [Hexadecimal] The data color of the widget (Large)
  # @param labelcolor [Hexadecimal] The label color of the widget (Large)
  # @param highlightcolor [Hexadecimal] The highlight color of the widget (Large)
  # @param avatarbg [Hexadecimal] The avatar background color of the widget (Small)
  # @param leftcolor [Hexadecimal] The left color of the widget (Small)
  # @param rightcolor [Hexadecimal] The right color of the widget (Small)
  # @param lefttextcolor [Hexadecimal] The left text color of the widget (Small)
  # @param righttextcolor [Hexadecimal] The right text color of the widget (Small)
  # @param noavatar [true, false] Whether there should be an avatar (Small)
  def initialize(size: 'large', file_type: 'png',
                 small_type: nil,
                 topcolor: nil, middlecolor: nil, usernamecolor: nil, certifiedcolor: nil, datacolor: nil, labelcolor: nil, highlightcolor: nil,
                 avatarbg: nil, leftcolor: nil, rightcolor: nil, lefttextcolor: nil, righttextcolor: nil, noavatar: nil,
                 id: nil)
    @size = size
    @file_type = file_type
    @small_type = small_type
    @topcolor = topcolor
    @middlecolor = middlecolor
    @usernamecolor = usernamecolor
    @certifiedcolor = certifiedcolor
    @datacolor = datacolor
    @labelcolor = labelcolor
    @highlightcolor = highlightcolor
    @avatarbg = avatarbg
    @leftcolor = leftcolor
    @rightcolor = rightcolor
    @lefttextcolor = lefttextcolor
    @righttextcolor = righttextcolor
    @noavatar = noavatar
    @id = id

    raise DBLRuby::Errors::InvalidWidget, 'Small size specified but no small type was provided' if @size == 'small' && @small_type.nil?
    raise DBLRuby::Errors::InvalidWidget, 'Small parameter specified for large widget' if @size == 'large' && (!@avatarbg.nil? || !@leftcolor.nil? || !@rightcolor.nil? || !@lefttextcolor.nil? || !@righttextcolor.nil? || !@noavatar.nil?)
    raise DBLRuby::Errors::InvalidWidget, 'Large parameter specified for small widget' if @size == 'small' && (!@topcolor.nil? || !@middlecolor.nil? || !@usernamecolor.nil? || !@certifiedcolor.nil? || !@datacolor.nil? || !@labelcolor.nil? || !@highlightcolor.nil?)

    raise DBLRuby::Errors::InvalidWidget, 'Invalid size' unless %w[small large].include? @size
    raise DBLRuby::Errors::InvalidWidget, 'Invalid small widget type' if @size == 'small' && !%w[owner status upvotes servers lib].include?(@small_type)
    raise DBLRuby::Errors::InvalidWidget, 'Invalid file type' unless %w[png svg].include? @file_type
  end

  # @return [String] The URL, ready for linking.
  def url
    params = []
    if @size == 'large'
      params.push("topcolor=#{@topcolor}") unless @topcolor.nil?
      params.push("middlecolor=#{@middlecolor}") unless @middlecolor.nil?
      params.push("usernamecolor=#{@usernamecolor}") unless @usernamecolor.nil?
      params.push("certifiedcolor=#{@certifiedcolor}") unless @certifiedcolor.nil?
      params.push("datacolor=#{@datacolor}") unless @datacolor.nil?
      params.push("labelcolor=#{@labelcolor}") unless @labelcolor.nil?
      params.push("highlightcolor=#{@highlightcolor}") unless @highlightcolor.nil?
      output = "#{BASE_URL}#{@id}.#{@file_type}"
    elsif @size == 'small'
      params.push("avatarbg=#{@avatarbg}") unless @avatarbg.nil?
      params.push("leftcolor=#{@leftcolor}") unless @leftcolor.nil?
      params.push("rightcolor=#{@rightcolor}") unless @rightcolor.nil?
      params.push("certifiedcolor=#{@certifiedcolor}") unless @certifiedcolor.nil?
      params.push("lefttextcolor=#{@lefttextcolor}") unless @lefttextcolor.nil?
      params.push("righttextcolor=#{@labelcolor}") unless @righttextcolor.nil?
      params.push("noavatar=#{@noavatar}") unless @noavatar.nil?
      output = "#{BASE_URL}#{@small_type}/#{@id}.#{@file_type}"
    end
    output += "?#{params.join('&')}" unless params.length.zero?
    output
  end

  alias_method :to_s, :url
end
