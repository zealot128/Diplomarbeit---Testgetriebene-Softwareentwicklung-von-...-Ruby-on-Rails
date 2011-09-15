class TestImportedFeed < ActiveRecord::Test

  test "Import eines Feeds soll eine HTTP Anfrage auslösen" do
    HTTParty.expects(:get).with("http://www.example.com/feed.xml")
    # Wir erwarten, dass innerhalb dieses Tests
    #     HTTParty.get("http://www.example.com/feed.xml")
    # aufgerufen werden

    ImportedFeed.new("http://www.example.com/feed.xml")
  end

end
