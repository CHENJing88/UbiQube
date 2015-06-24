# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#appeller Created: <%= @my_object.created_at.to_s(:dots) %>
[Time::DATE_FORMATS, Date::DATE_FORMATS].each do |obj| obj[:dots] = "%d/%m/%y"
