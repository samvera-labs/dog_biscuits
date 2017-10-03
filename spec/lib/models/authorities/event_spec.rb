# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Event do
  let(:stubby) { FactoryGirl.build(:event) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'end_date'
  it_behaves_like 'start_date'
  # TODO: location

  it 'is an event' do
    expect(stubby).to be_event
  end

  # test metadata properties
  describe '#metadata' do
    specify { stubby.type.should include('http://schema.org/Event') }
    specify { stubby.name.should eq('International Conference of Misery') }
  end

  it 'has preflabel' do
    stubby.add_label
    expect(stubby.preflabel).to eq('International Conference of Misery (1-1-2016 - 10-1-2016)')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { rdf.should include('http://xmlns.com/foaf/0.1/name') }
  end
end
