# frozen_string_literal: true

shared_examples_for 'department' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:org) { FactoryGirl.build_stubbed(:organisation) }

  before do
    stubby.department_resource << org
  end
  # metadata
  it 'has department' do
    expect(stubby.department_resource.first).to eq(org)
  end

  it 'has department predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end

  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('department_label_tesim')))
  end
end
