# frozen_string_literal: true

require 'jtc/parser'
require 'jtc/validator'

RSpec.describe JTC::Validator do
  describe '#validate_json!' do
    let(:input) { JTC::Parser.parse(File.read(load_test_data('users.json'))) }

    it 'validates a JSON string' do
      expect { described_class.validate_json!(input) }.not_to raise_error
    end

    it 'raises a `JTC::NonArray` if an Array' do
      input = JTC::Parser.parse(File.read(load_test_data('not_array.json')))
      expect { described_class.validate_json!(input) }.to raise_error(JTC::ParsingError)
    end

    it 'raises a `JTC::UnbalancedObject` if given an Array with unbalanced Hashes' do
      input = JTC::Parser.parse(File.read(load_test_data('unbalanced.json')))
      expect { described_class.validate_json!(input) }.to raise_error(JTC::UnbalancedObject)
    end

    it 'raises a `JTC::EmptyArray` if given an empty Array' do
      expect { described_class.validate_json!([]) }.to raise_error(JTC::EmptyArray)
    end
  end
end
