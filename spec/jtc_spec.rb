# frozen_string_literal: true

require 'jtc'

RSpec.describe JTC do
  describe '#convert' do
    it 'returns true' do
      expect(described_class.convert('')).to eq(true)
    end
  end
end
