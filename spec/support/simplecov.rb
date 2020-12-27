# frozen_string_literal: true

require 'simplecov'
require 'codecov'

SimpleCov.start do
  enable_coverage :branch
end

SimpleCov.formatter = SimpleCov::Formatter::Codecov if ENV['CODECOV_TOKEN']
