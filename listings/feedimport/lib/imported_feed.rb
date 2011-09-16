require "httparty"


class ImportedFeed

  def initialize(url)
    HTTParty.get(url)
  end
end
