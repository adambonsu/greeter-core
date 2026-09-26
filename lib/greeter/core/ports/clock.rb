# frozen_string_literal: true

module Greeter
  module Core
    module Ports
      class Clock
        def now
          raise NotImplementedError, "#{self.class}#now is not implemented"
        end
      end
    end
  end
end
