# ports Specification

## Purpose

Defines the abstract interfaces (ports) that the domain depends on and that
consuming applications implement with concrete adapters. Ports are the contract
at the hexagonal boundary: the `Clock` driven port supplies time, and the
`GreetingPresenter` driving port renders a `Greeting`. Each port's methods raise
`NotImplementedError` until an adapter overrides them, so an unimplemented port
fails loudly rather than silently.

Traceability note: each scenario below maps to exactly one RSpec example in the
gem's `spec/ports/` suite.

## Requirements

### Requirement: Clock port declares an unimplemented #now
`Greeter::Core::Ports::Clock#now` SHALL raise `NotImplementedError` when called
on the base port, documenting the contract that a concrete clock adapter (e.g.
`SystemClock` in a consuming app, or `Greeter::Core::Testing::FixedClock` in
tests) must satisfy.

#### Scenario: Base Clock#now raises NotImplementedError
- **WHEN** `Greeter::Core::Ports::Clock.new.now` is called
- **THEN** it raises `NotImplementedError`
- Maps to: `spec/ports/clock_spec.rb`

### Requirement: GreetingPresenter port declares an unimplemented #present
`Greeter::Core::Ports::GreetingPresenter#present(greeting)` SHALL raise
`NotImplementedError` when called on the base port, documenting the contract
that a concrete presenter adapter (e.g. a CLI or Lambda presenter in a consuming
app) must satisfy.

#### Scenario: Base GreetingPresenter#present raises NotImplementedError
- **WHEN** `Greeter::Core::Ports::GreetingPresenter.new.present(greeting)` is called
- **THEN** it raises `NotImplementedError`
- Maps to: `spec/ports/greeting_presenter_spec.rb`
