# frozen_string_literal: true

require 'pry'
require 'jtc'

RSpec.describe JTC do
  describe '#convert' do
    let(:input) { File.read(load_test_data('users.json')) }
    let(:output) { File.read(load_test_data('users.csv')) }

    it 'converts a JSON string to a valid CSV string' do
      expect(described_class.convert(input)).to eq(output)
    end

    it 'raises a `JTC::ParsingError` if given an invalid JSON string' do
      expect { described_class.convert(input[0..-5]) }.to raise_error(JTC::ParsingError)
    end
  end
end
