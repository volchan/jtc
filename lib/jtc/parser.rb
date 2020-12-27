# frozen_string_literal: true

module JTC
  class Parser
    attr_reader :json, :parsed_json

    private

    attr_writer :parsed_json

    public

    class <<self
      def parse(json)
        new(json).call
      end
    end

    def initialize(json)
      @json = json
      @parsed_json = nil
    end

    def call
      self.parsed_json = JSON.parse(json)
    rescue JSON::ParserError, TypeError
      raise ParsingError, 'Invalid JSON string'
    end
  end
end
