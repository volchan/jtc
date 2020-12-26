# frozen_string_literal: true

def load_test_data(filename)
  path = Pathname.new("spec/test_data/#{filename}")
  return ArgumentError, "Can't find fixture with at: #{path}" unless path

  path
end
