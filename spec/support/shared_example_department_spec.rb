# frozen_string_literal: true

shared_examples_for 'department' do
  # the class that includes the concern

  let(:org) { FactoryGirl.build_stubbed(:organisation) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  before do
    stubby.department_resource << org
  end
  # metadata
  it 'has department' do
    expect(stubby.department_resource.first).to eq(org)
  end

  it 'has department predicate' do
    expect(rdf.should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr['department_label_tesim'].should(eq([org.preflabel])))
  end
end
