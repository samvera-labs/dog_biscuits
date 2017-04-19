# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Place do
  let(:place) { FactoryGirl.create(:place) }

  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'mads_related_authority'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'add_place_properties'
  it_behaves_like 'skos_note'

  it 'is a place' do
    expect(place).to be_place
  end

  describe '#rdftypes' do
    specify { place.type.should include('http://schema.org/Place') }
    specify { place.type.should include('http://www.europeana.eu/schemas/edm/Place') }
  end

  it 'gets a preflabel from place elements' do
    place.add_preflabel
    expect(place.preflabel).to eq('Didsbury, Madeup Parish, Manchester, Greater Manchester, England, United Kingdom')
  end
end
