# encoding: UTF-8
require "test_helper"   # Stuff that we need for convenient tests
require "imported_feed" # Object under Test
require "test/unit"
require "ostruct"

class TestImportedFeed < ActiveSupport::TestCase
  setup do
    @fake_response = OpenStruct.new
    @fake_response.code = 200  # HTTP OK!
    @fake_response.body = "<?xml version='1.0'?><Hallo/>"
    @url = "http://example.com/feed.xml"
  end

  should "perform a get request when initializing" do
    mock_feed
    ImportedFeed.new(@url)
  end

  should "really get content from an feed" do
    mock_feed
    import = ImportedFeed.new(@url)
    assert_match /Hallo/, import.body
  end

  should "use nokogiri to parse that feed" do
    mock_feed
    Nokogiri.expects(:XML)

    import = ImportedFeed.new(@url)

  end


end
