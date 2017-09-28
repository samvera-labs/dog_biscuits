# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Work do
  let(:stubby) { FactoryGirl.build(:thesis) }

  after do
    stubby.destroy
  end

  it 'is a work' do
    expect(stubby).to be_work
  end
end
