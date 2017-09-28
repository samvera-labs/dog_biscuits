# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Project do
  let(:stubby) { FactoryGirl.build(:project) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it_behaves_like 'identifier'

  it 'is a project' do
    expect(stubby).to be_project
  end

  # test metadata properties
  describe '#metadata' do
    specify { stubby.type.should include('http://xmlns.com/foaf/0.1/Project') }
    specify { stubby.name.should eq('A scientific study into misery') }
    specify { stubby.funder.should eq(['funder']) }
  end

  it 'has a preflabel combining name and identifier' do
    stubby.add_label
    expect(stubby.preflabel).to eq('A scientific study into misery (id: identifier_test)')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { rdf.should include('http://purl.org/dc/terms/identifier') }
    specify { rdf.should include('http://xmlns.com/foaf/0.1/name') }
    specify { rdf.should include('http://id.loc.gov/vocabulary/relators/fnd') }
  end
end
