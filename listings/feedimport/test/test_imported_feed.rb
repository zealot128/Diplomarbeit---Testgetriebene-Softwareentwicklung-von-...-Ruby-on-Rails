# encoding: UTF-8
require "test_helper"   # Stuff that we need for convenient tests
require "imported_feed" # Object under Test
require "test/unit"

class TestImportedFeed < ActiveSupport::TestCase

  should "get an feed through httparty" do
    HTTParty.expects(:get).with("http://www.example.com")

    ImportedFeed.new("http://www.example.com")
  end
end
