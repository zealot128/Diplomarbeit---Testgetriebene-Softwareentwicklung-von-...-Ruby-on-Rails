require "httparty"
require "nokogiri"

class ImportedFeed
  attr_reader :body, :doc, :status_code
  def initialize(url)
    response = HTTParty.get(url)
    @status_code = response.code
    @body = response.body
    @doc = Nokogiri.XML(@body)
  end


  def valid?
    [
      @doc.search("rss").count == 1,
      @status_code == 200,
    ].all?
  end
end

