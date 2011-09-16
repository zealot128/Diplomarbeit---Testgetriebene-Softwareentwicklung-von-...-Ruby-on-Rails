#require "turn"
require "ansi"
require "turn"
require "mocha"
require "shoulda"
require "active_support/all"
#require "active_support/all"
class ActiveSupport::TestCase
  def mock_feed(url=@url, response=@fake_response)
    HTTParty.expects(:get).with(url).returns(response)
  end
end
