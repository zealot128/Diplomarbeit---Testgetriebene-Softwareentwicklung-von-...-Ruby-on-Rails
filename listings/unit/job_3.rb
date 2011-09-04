class Job < ActiveRecord::Base
  validates :email, :format => /^[\w\d_\-]+@[\w\d_\-]\.[\w\d]{2,3}$/
  ...
end
