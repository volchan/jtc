# frozen_string_literal: true

require 'yaml'
require 'jtc/parser'

RSpec.describe JTC::Parser do
  describe '#parse' do
    let(:input) { File.read(load_test_data('users.json')) }
    let(:output) { YAML.load_file(load_test_data('users.yml')) } # loads the users data as a ruby hash

    it 'parses a JSON string to a valid ruby hash' do
      expect(described_class.parse!(input)).to eq(output)
    end

    it 'raises a `JTC::ParsingError` if given an invalid JSON string' do
      expect { described_class.parse!(input[0..-5]) }.to raise_error(JTC::ParsingError)
    end
  end
end
