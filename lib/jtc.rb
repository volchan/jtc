# frozen_string_literal: true

require 'csv'
require 'json'

require_relative 'jtc/convertor'
require_relative 'jtc/errors'
require_relative 'jtc/parser'
require_relative 'jtc/validator'

module JTC
  class <<self
    def convert(json)
      parsed_json = Parser.parse!(json)
      Validator.validate_json!(parsed_json)
      Convertor.convert!(parsed_json)
    end
  end
end
