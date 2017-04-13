# frozen_string_literal: true

require 'rspec'

describe 'Place Validator' do
  let(:place) { DogBiscuits::Place.new }

  it 'should not save without a place name' do
    expect(place.save).to be_falsey
  end

  it 'should save with a place name' do
    place.place_name = 'Scunthorpe'
    expect(place.save).to be_truthy
  end

  it 'should add a preflabel' do
    place.place_name = 'Scunthorpe'
    place.save
    expect(place.preflabel).to eq('Scunthorpe')
  end
end
