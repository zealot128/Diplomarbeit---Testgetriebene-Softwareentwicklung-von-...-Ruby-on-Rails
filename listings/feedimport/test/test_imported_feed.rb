# encoding: UTF-8
require "test_helper"   # Stuff that we need for convenient tests
require "imported_feed" # Object under Test
require "test/unit"
require "ostruct"

class TestImportedFeed < ActiveSupport::TestCase
  setup do
    @url = "http://example.com/feed.xml"
  end

  context "for retrieving the feed" do
    should "perform a get request when initializing" do
      mock_feed
      ImportedFeed.new(@url)
    end

    should "really get content from an feed" do
      mock_feed
      import = ImportedFeed.new(@url)
      assert import.body.is_a? String
      assert import.body.length > 20
    end

    should "use nokogiri to parse that feed" do
      mock_feed
      Nokogiri.expects(:XML)

      import = ImportedFeed.new(@url)
    end

    should "...and provide that parsed document for later" do
      mock_feed
      import = ImportedFeed.new(@url)
      assert import.doc.is_a? Nokogiri::XML::Document
    end

    should "also remember the status code" do
      mock_feed
      import = ImportedFeed.new(@url)
      assert_equal 200, import.status_code
    end
  end

  context "for distinguishing a valid feed" do

    should "have a valid? method" do
      mock_feed
      import = ImportedFeed.new(@url)
      assert import.respond_to?(:valid?)
    end

    should "not validate if the user server reports a problem" do
      mock_feed :code => 404
      feed = ImportedFeed.new(@url)
      assert !feed.valid?
    end

    should "validate if http status code is OK" do
      mock_feed :code => 200
      feed = ImportedFeed.new(@url)
      assert feed.valid?
    end

    should "validate if that feed is a valid RSS feed" do
      mock_feed :body => '<?xml version="1.0" encoding="UTF-8"?>
      <feed>
        <blablub />
      </feed>'

      feed = ImportedFeed.new(@url)
      assert !feed.valid?
    end

    should "validate a real RSS-feed" do
      mock_feed :body => '<?xml version="1.0" encoding="UTF-8"?>
      <rss>
        <channel>
          <item>
            <title>Hallo</title>
            <description>Hallo</description>
          </item>
        </channel>
      </rss>'
      feed = ImportedFeed.new(@url)
      assert feed.valid?
    end

    should "be resistent to any thrown errors from library" do
      HTTParty.expects(:get).raises( ArgumentError)
      feed = nil
      assert_nothing_raised(ArgumentError, "Raised Error! Our App is crashed") do
        feed = ImportedFeed.new(@url)
      end
      assert !feed.valid?
    end

  end

  context "getting the items" do
    setup do
      @content = make_feed do |xml|
        xml.item do
          xml.title "Hallo Welt"
        end
        xml.item do
          xml.title "Hallo Welt2"
        end
      end
    end
    should "have a helper method for generating a feed" do
      assert_match /<title>\s*Hallo Welt/, @content
    end

    should "search for the items" do
      mock_feed :body => @content
      feed = ImportedFeed.new(@url)

      assert_equal 2, feed.items.count
    end
  end


end
