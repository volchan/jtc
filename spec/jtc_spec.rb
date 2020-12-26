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

    it 'raises a `JTC::ParsingError` if given a non Array JSON string' do
      input = File.read(load_test_data('not_array.json'))
      expect { described_class.convert(input) }.to raise_error(JTC::ParsingError)
    end

    it 'raises a `JTC::UnbalancedObject` if given a JSON array with unbalanced objects' do
      input = File.read(load_test_data('unbalanced.json'))
      expect { described_class.convert(input) }.to raise_error(JTC::UnbalancedObject)
    end
  end
end
