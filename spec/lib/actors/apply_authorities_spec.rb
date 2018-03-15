# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Actors::ApplyAuthorities do
  subject(:middleware) do
    stack = ActionDispatch::MiddlewareStack.new.tap do |middleware|
      middleware.use Hyrax::Actors::ConferenceItemActor
    end
    stack.build(terminator)
  end
  let(:work) { FactoryBot.build(:conference_item) }
  let(:user) { FactoryBot.create(:depositor) }
  let(:ability) { ::Ability.new(user) }
  let(:env) { Hyrax::Actors::Environment.new(work, ability, attributes) }
  let(:attributes) { { subject: ['subject-thing'] } }
  let(:terminator) { Hyrax::Actors::Terminator.new }

  before do
    allow(terminator).to receive(:create).and_return(true)
  end

  it "calls apply_attributes" do
    expect(middleware).to receive(:apply_authorities).with(
      env
    )
    middleware.create(env)
  end

  it "doesn't call add_new" do
    DogBiscuits.config.authorities_add_new = []
    expect(middleware).not_to receive(:add_new)
    middleware.create(env)
  end

  it "calls add_new" do
    DogBiscuits.config.authorities_add_new = [:subjects]
    expect(middleware).to receive(:add_new).with(
      'subjects',
      'subject-thing'
    )
    middleware.create(env)
  end

  after do
    user.destroy
  end
end
