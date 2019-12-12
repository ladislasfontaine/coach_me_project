# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# SENDGRID
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_LOGIN'],
  password: ENV['SENDGRID_PWD'],
  domain: 'https://coachme.herokuapp.com/',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

# Block class:field_with_errors form device
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
