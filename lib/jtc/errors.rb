# frozen_string_literal: true

module JTC
  class ParsingError < StandardError; end

  class UnbalancedObject < ParsingError; end

  class EmptyArray < ParsingError; end
end
