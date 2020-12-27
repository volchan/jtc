# frozen_string_literal: true

module JTC
  class Validator
    attr_reader :json

    class <<self
      def validate_json!(json)
        new(json).call
      end
    end

    def initialize(json)
      @json = json
    end

    def call
      raise JTC::NonArray, 'JSON is not an array' unless json.is_a?(Array)
      raise JTC::EmptyArray, 'JSON Array must have at least one object' unless json.size.positive?
      raise JTC::UnbalancedObject, 'Objects are unbalanced' unless balanced?
    end

    private

    def balanced?
      json.map { |object| generate_csv_header(object) }.uniq.size == 1
    end

    def generate_csv_header(json)
      json.flat_map do |key, value|
        next key unless value.is_a?(Hash)

        generate_csv_header(value).map { |head| [key, head].join('.') }
      end
    end
  end
end
