require "httparty"
require "nokogiri"

class ImportedFeed
  attr_reader :body, :doc, :status_code

  def initialize(url)
    get_feed(url)
    @error_thrown = false
  rescue Exception => e
    @error_thrown = true
  end

  def get_feed(url)
    response = HTTParty.get(url)
    @status_code = response.code
    @body = response.body
    @doc = Nokogiri.XML(@body)
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

