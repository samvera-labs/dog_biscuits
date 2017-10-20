# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Actors::SingularAttributes do
  let(:work) { FactoryGirl.build(:conference_item) }
  let(:user) { FactoryGirl.create(:depositor) }
  let(:ability) { ::Ability.new(user) }
  let(:env) { Hyrax::Actors::Environment.new(work, ability, attributes) }
  let(:attributes) { { date_created: '2012' } }
  let(:terminator) { Hyrax::Actors::Terminator.new }

  subject(:middleware) do
    stack = ActionDispatch::MiddlewareStack.new.tap do |middleware|
      middleware.use Hyrax::Actors::ConferenceItemActor
    end
    stack.build(terminator)
  end

  before do
    allow(terminator).to receive(:create).and_return(true)
  end

  context "#create" do
    before do
      allow(terminator).to receive(:create).and_return(true)
      middleware.create(env)
    end

    it "wraps singular attributes into an array and adds them to the work" do
      expect(env.curation_concern.attributes["date_created"]).to eq(['2012'])
    end
  end

  context "#update" do
    before do
      allow(terminator).to receive(:create).and_return(true)
      middleware.update(env)
    end

    it "wraps singular attributes into an array and adds them to the work" do
      expect(env.curation_concern.attributes["date_created"]).to eq(['2012'])
    end
  end

  after do
    user.destroy
  end
end
