require "httparty"
require "nokogiri"

class ImportedFeed
  attr_reader :body
  def initialize(url)
    response = HTTParty.get(url)
    @body = response.body

    Nokogiri.XML(@body)

  end
end

