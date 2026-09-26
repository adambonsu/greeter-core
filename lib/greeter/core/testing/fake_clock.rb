# frozen_string_literal: true

module Greeter
  module Core
    module Testing
      class FakeClock
        def initialize(time)
          @time = time
        end

        def now
          @time
        end
      end
    end
  end
end
