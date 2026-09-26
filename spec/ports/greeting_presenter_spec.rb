# frozen_string_literal: true

RSpec.describe Greeter::Core::Ports::GreetingPresenter do
  it 'raises NotImplementedError on #present' do
    expect { described_class.new.present(double) }.to raise_error(NotImplementedError)
  end
end
