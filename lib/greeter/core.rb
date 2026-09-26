# frozen_string_literal: true

require 'greeter/core/version'

# Ports (interfaces)
require 'greeter/core/ports/clock'
require 'greeter/core/ports/greeting_presenter'

# Domain (value objects + use case)
require 'greeter/core/domain/guest_name'
require 'greeter/core/domain/greeting'
require 'greeter/core/domain/greeting_service'

module Greeter
  module Core
  end
end