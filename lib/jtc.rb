# frozen_string_literal: true

p 'hello'

class JTC
  class <<self
    def convert(_json)
      true
    end
  end
end
