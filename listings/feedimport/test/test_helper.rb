require "shoulda"
require "rr"
require "turn"
#require "active_support/all"
class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end
