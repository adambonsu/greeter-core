# greeter-core

Pure domain core and ports for the Greeter application.

## Usage
```ruby
require 'greeter/core'

clock    = my_clock # any object responding to #now
service  = Greeter::Core::Domain::GreetingService.new(clock: clock)
greeting = service.greet('alice')
greeting.guest_name.display # => "Alice"
```

## Testing helpers
```ruby
require 'greeter/core/testing'
clock = Greeter::Core::Testing::FixedClock.new
```

## Install, verify, commit
### from greeter-core root
`bundle install`

### domain + ports + testing specs
`bundle exec rspec`

### lint
`bundle exec rubocop`

### smoke-test the packaged load path resolves and behaves
`bundle exec ruby -Ilib -e "require 'greeter/core'; puts Greeter::Core::Domain::GuestName.new('alice bonsu').display" # => Alice Bonsu

## confirm the gem builds cleanly
gem build greeter-core.gemspec