require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "ein Job muss einen Titel haben" do
    job = Job.new
    job.title = nil
    assert !job.save
  end
end
