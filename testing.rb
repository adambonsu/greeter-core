# frozen_string_literal: true

# Opt-in test doubles for consumers of greeter-core.
# Not loaded by `require 'greeter/core'` so production stays I/O-free.
require 'greeter/core/testing/fake_clock'
require 'greeter/core/testing/fixed_clock'