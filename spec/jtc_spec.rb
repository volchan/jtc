# frozen_string_literal: true

require 'jtc'

RSpec.describe JTC do
  describe '#convert' do
    let(:input) { File.read(load_test_data('users.json')) }
    let(:output) { File.read(load_test_data('users.csv')) }

    it 'converts a JSON string to a valid CSV string' do
      expect(described_class.convert(input)).to eq(output)
    end
  end
end
