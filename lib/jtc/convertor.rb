# frozen_string_literal: true

require_relative 'errors'

module JTC
  class Convertor
    attr_reader :json

    private

    attr_accessor :headers

    public

    def initialize(json)
      @json = json
      @headers = nil
      validate_json!
    end

    def call
      self.headers = generate_csv_header(parsed_json.first)

      CSV.generate do |csv|
        csv << headers
        parsed_json.each do |object|
          csv << generate_csv_line(object)
        end
      end
    end

    private

    def validate_json!
      raise JTC::ParsingError, 'JSON is not an array' unless parsed_json.is_a?(Array)
      raise JTC::UnbalancedObject, 'Objects are unbalanced' unless balanced?
    end

    def balanced?
      parsed_json.map { |object| generate_csv_header(object) }.uniq.size == 1
    end

    def parsed_json
      @parsed_json ||= JSON.parse(json)
    rescue JSON::ParserError, TypeError
      raise ParsingError, 'Invalid JSON string'
    end

    def generate_csv_header(json)
      json.flat_map do |key, value|
        next key unless value.is_a?(Hash)

        generate_csv_header(value).map { |head| [key, head].join('.') }
      end
    end

    def generate_csv_line(object)
      headers.map do |header|
        value = header.split('.').reduce(object) { |obj, key| obj[key] }
        value.is_a?(Array) ? value.join(',') : value
      end
    end
  end
end
