class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs :valid_job
    # Dies lädt den Job mit dem Schlüssel "valid_job"
    #  und schreibt ihn in die Instanzvariable @job
    #  der Testklasse 
  end
  test "stelle sicher, dass die Fixtures valide sind" do
    assert_valid @job
  end
  test "ein Job muss einen Titel haben" do
    @job.title = nil
    assert !@job.save
  end
  test "ein Job muss eine gültige E-Mail haben" do
    @job.email = "invalid_email"
    assert !@job.save
  end
end
