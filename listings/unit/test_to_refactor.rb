test "ein Job muss einen Titel haben" do
  job = Job.new :title => nil
  assert !job.save
end
test "ein Job muss eine gültige E-Mail haben" do
  job = Job.new :email => "invalid_email"
  assert !job.save
end
test "ein Job muss einen Titel haben" do
  job = Job.new :title => "Rails Entwickler", :email => "info@stefanwienert.net"
  assert_valid job
end
