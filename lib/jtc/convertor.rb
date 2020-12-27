# frozen_string_literal: true

require_relative 'utils'
module JTC
  class Convertor
    include Utils

    attr_reader :json

    private

    attr_accessor :headers

    public

    class <<self
      def convert!(json)
        new(json).call
      end
    end

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

    def generate_csv_line(object)
      headers.map do |header|
        value = header.split('.').reduce(object) { |obj, key| obj[key] }
        value.is_a?(Array) ? value.join(',') : value
      end
    end
  end
end
