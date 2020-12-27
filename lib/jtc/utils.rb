# frozen_string_literal: true

module JTC
  module Utils
    private

    def generate_csv_header(json)
      @generate_csv_header ||= {}
      @generate_csv_header[json] ||= json.flat_map do |key, value|
        next key unless value.is_a?(Hash)

        generate_csv_header(value).map { |head| [key, head].join('.') }
      end
    end
  end
end
