# frozen_string_literal: true

require 'csv'
require 'json'

require_relative 'jtc/convertor'

module JTC
  class <<self
    def convert(json)
      Convertor.new(json).call
    end
  end
end
