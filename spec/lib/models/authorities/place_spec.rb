# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Place do
  let(:stubby) { FactoryGirl.create(:place) }

  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'related_authority'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'place_properties'
  it_behaves_like 'skos_note'

  it 'is a place' do
    expect(stubby).to be_place
  end

  describe '#rdftypes' do
    specify { stubby.type.should include('http://schema.org/Place') }
    specify { stubby.type.should include('http://www.europeana.eu/schemas/edm/Place') }
  end

  it 'gets a preflabel from place elements' do
    stubby.add_preflabel
    expect(stubby.preflabel).to eq('Didsbury, Madeup Parish, Manchester, Greater Manchester, England, United Kingdom')
  end
end
