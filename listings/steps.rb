Wenn /^ich "([^"]*)" für a und "([^"]*)" für b eingebe$/ do |arg1, arg2|
  @addierer = Addierer.new(arg1, arg2)
end

Wenn /^auf "([^"]*)" klicke$/ do |arg1|
  @result = @addierer.add()
end

Dann /^sehe ich "([^"]*)"$/ do |arg1|
  assert_equal( arg1.to_f, @result)
end

