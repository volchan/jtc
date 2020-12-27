# frozen_string_literal: true

require 'jtc/parser'
require 'jtc/convertor'

RSpec.describe JTC::Convertor do
  let(:test_instance) { described_class.new('') }

  it_behaves_like 'Utils'

  describe '#convert!' do
    let(:input) { JTC::Parser.parse!(File.read(load_test_data('users.json'))) }
    let(:output) { File.read(load_test_data('users.csv')) }

    it 'converts a JSON string to a valid CSV string' do
      expect(described_class.convert!(input)).to eq(output)
    end
  end
end
