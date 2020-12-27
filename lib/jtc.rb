# frozen_string_literal: true

require 'csv'
require 'json'

require_relative 'jtc/convertor'
require_relative 'jtc/errors'
require_relative 'jtc/parser'

module JTC
  class <<self
    def convert(json)
      parsed_json = Parser.parse(json)
      Convertor.new(parsed_json).call
    end
  end
end
