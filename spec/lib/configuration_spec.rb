# frozen_string_literal: true

RSpec.describe DogBiscuits::Configuration do
  subject { described_class.new }

  it { is_expected.to respond_to(:creator_class) }
  it { is_expected.to respond_to(:creator_class=) }
end
