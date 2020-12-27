# frozen_string_literal: true

module JTC
  class Convertor
    attr_reader :json

    private

    attr_accessor :headers

    public

    def initialize(json)
      @json = json
      @headers = nil
    end

    def call
      self.headers = generate_csv_header(json.first)

      CSV.generate do |csv|
        csv << headers
        json.each do |object|
          csv << generate_csv_line(object)
        end
      end
    end

    private

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
