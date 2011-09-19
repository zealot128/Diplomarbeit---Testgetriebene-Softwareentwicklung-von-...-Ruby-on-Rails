# encoding: utf-8
Angenommen /^wir befinden uns auf der Startseite$/ do
  visit "/"
end
Wenn /^wir "([^"]*)" für "([^"]*)" eintippen$/ do |text, input_name|
  fill_in input_name, :with => text
end
Und /^wir auf den Button "([^"]*)" klicken$/ do |text|
  click_button text
end

Dann /^sehen wir "([^"]*)"$/ do |string|
  assert page.has_content?(string)
end

# table.hashes ->
#  [ {:title => "Ruby on Rails Entwickler",  :visible => true},
#    {:title => "Java Programmierer",        :visible => true}]
Angenommen /^die folgenden Jobs sind vorhanden:$/ do |table|
  valid_job = jobs(:visible_job).attributes
  table.hashes.each do |hash|
    attributes = valid_job.merge(hash)
    Job.create(attributes)
  end
end
