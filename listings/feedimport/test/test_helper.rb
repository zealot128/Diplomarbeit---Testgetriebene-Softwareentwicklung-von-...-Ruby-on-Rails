require 'simplecov'
SimpleCov.start
require "ansi"
require "turn"
require "mocha"
require "shoulda"
require "active_support/all"
require "builder"
require "ostruct"


class ActiveSupport::TestCase

  def mock_feed(opts={})
    options = {
      :url => @url,
      :code => 200,
      :body => make_feed
    }.merge opts
    response = OpenStruct.new
    response.code = options[:code]
    response.body = options[:body]

    HTTParty.expects(:get).with(options[:url]).returns(response)
  end

  def make_feed()
    builder = Builder::XmlMarkup.new( :indent=>2)
    builder.instruct!
    builder.rss do
      builder.channel do
        yield(builder) if block_given?
      end
    end
    builder.target!
  end

end
