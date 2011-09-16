require "httparty"
require "nokogiri"

class ImportedFeed
  attr_reader :body, :doc, :status_code, :items

  def initialize(url)
    get_feed(url)
    parse_feed
    @error_thrown = false
  rescue Exception => e
    @error_thrown = true
  end

  def get_feed(url)
    response = HTTParty.get(url)
    @status_code = response.code
    @body = response.body
  end

  def parse_feed
    @doc = Nokogiri.XML(@body)
    @items = @doc.search("item")
  end

  def valid?
    [
      !@error_thrown,
      is_a_rss_feed?,
      @status_code == 200,
    ].all?
  end

  def is_a_rss_feed?
    return false   if @doc.nil?
    @doc.search("rss").count == 1
  end
end

