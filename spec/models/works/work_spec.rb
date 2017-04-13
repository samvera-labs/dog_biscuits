# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Work do
  let(:work) { FactoryGirl.build(:dataset) }

  it 'is a work' do
    expect(work).to be_work
  end

  it 'can be edited by members of the admin group' do
    expect(work.edit_groups).to eq(['admin'])
  end

  it 'is has a depositor who can edit the item' do
    work.apply_depositor
    expect(work.depositor).to eq('depositor@example.com')
  end

  it 'can be edited by depositor' do
    work.apply_depositor
    expect(work.edit_users).to eq(['depositor@example.com'])
  end
end
