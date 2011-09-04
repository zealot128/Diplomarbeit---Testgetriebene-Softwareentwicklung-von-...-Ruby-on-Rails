# config/initializers/regex.rb
REGEX_EMAIL_FORMAT = /^[\w\d_\-]+@[\w\d_\-]\.[\w\d]{2,3}$/

# app/models/job.rb
class Job < ActiveRecord::Base
  validates :email, :format => REGEX_EMAIL_FORMAT
    ...
end
