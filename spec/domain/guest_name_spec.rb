# frozen_string_literal: true

RSpec.describe Greeter::Core::Domain::GuestName do
  # ---------------------------------------------------------------------------
  # Shared examples — Scenario: Rejects an empty or whitespace-only name
  #                   Scenario: Rejects a name longer than 64 characters
  #                   Scenario: Rejects names containing control or escape characters
  # ---------------------------------------------------------------------------
  shared_examples 'an invalid guest name' do |raw|
    it "raises InvalidGuestName for #{raw.inspect}" do
      expect { described_class.new(raw) }
        .to raise_error(Greeter::Core::Domain::InvalidGuestName)
    end
  end

  it_behaves_like 'an invalid guest name', ''
  it_behaves_like 'an invalid guest name', '   '
  it_behaves_like 'an invalid guest name', 'a' * 65
  it_behaves_like 'an invalid guest name', "\e[31m"
  it_behaves_like 'an invalid guest name', "Alice\n"

  # ---------------------------------------------------------------------------
  # Scenario: Greets a named guest — value is preserved after construction
  # ---------------------------------------------------------------------------
  describe '#display' do
    it 'returns the raw value for a simple valid name' do
      expect(described_class.new('Alice').display).to eq('Alice')
    end

    # Scenario: Normalises casing and whitespace
    it 'strips surrounding whitespace and title-cases the name' do
      expect(described_class.new('  alice smith  ').display).to eq('Alice Smith')
    end

    it 'accepts a name of exactly 64 characters' do
      name = 'a' * 64
      expect { described_class.new(name) }.not_to raise_error
    end
  end

  # ---------------------------------------------------------------------------
  # Value-object equality contract: == must be consistent with eql? and hash so
  # instances behave correctly as Hash keys and in Sets.
  # ---------------------------------------------------------------------------
  describe 'value equality' do
    let(:lower) { described_class.new('alice') }
    let(:upper) { described_class.new('Alice') }

    it 'treats names that normalise equally as ==' do
      expect(lower).to eq(upper)
    end

    it 'treats equal names as eql?' do
      expect(lower).to eql(upper)
    end

    it 'gives equal names the same hash' do
      expect(lower.hash).to eq(upper.hash)
    end

    it 'finds an equal name as a Hash key' do
      expect({ lower => 1 }[upper]).to eq(1)
    end

    it 'de-duplicates equal names in an Array#uniq' do
      expect([lower, upper].uniq.size).to eq(1)
    end
  end

  # ---------------------------------------------------------------------------
  # Scenario: Rejects names containing control or escape characters
  # — additional control-character boundary cases
  # ---------------------------------------------------------------------------
  describe 'control-character rejection' do
    it 'rejects a name containing a null byte' do
      expect { described_class.new("Ali\x00ce") }
        .to raise_error(Greeter::Core::Domain::InvalidGuestName)
    end

    it 'rejects a name containing DEL (0x7F)' do
      expect { described_class.new("Ali\x7Fce") }
        .to raise_error(Greeter::Core::Domain::InvalidGuestName)
    end
  end
end
