# frozen_string_literal: true

require 'jtc/parser'
require 'jtc/utils'
require 'pry'

class UtilsTest
  include JTC::Utils
  def public_generate_csv_header(json)
    generate_csv_header(json)
  end
end

RSpec.describe JTC::Utils do
  describe '#generate_csv_header' do
    let(:input) { JTC::Parser.parse(File.read(load_test_data('users.json'))).first }
    let(:valid_output) do
      %w[
        id
        email
        tags
        profiles.facebook.id
        profiles.facebook.picture
        profiles.twitter.id
        profiles.twitter.picture
      ]
    end

    it 'generates a valid csv header' do
      expect(UtilsTest.new.public_generate_csv_header(input)).to eq(valid_output)
    end
  end
end
