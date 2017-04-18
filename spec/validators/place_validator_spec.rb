# frozen_string_literal: true

require 'rspec'

describe DogBiscuits::PlaceValidator do
  let(:place) { DogBiscuits::Place.new }

  it 'does not save without a place name' do
    expect(place.save).to be_falsey
  end

  it 'saves with a place name' do
    place.place_name = 'Scunthorpe'
    expect(place.save).to be_truthy
  end

  it 'adds a preflabel' do
    place.place_name = 'Scunthorpe'
    place.save
    expect(place.preflabel).to eq('Scunthorpe')
  end
end
