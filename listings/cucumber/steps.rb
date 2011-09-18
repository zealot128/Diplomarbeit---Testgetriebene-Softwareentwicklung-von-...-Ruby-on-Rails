Wenn /^auf Button clicken$/ do
  click_button "button1"
end

Dann /sehen wir "([^"]+)"/ do |s|
  assert page.has_content?(s)
end
